import numpy as np
import matplotlib.pyplot as plt
import adi
import time

# Parameters
fc = int(2.5e9)           # Center frequency
g_tx = 0                  # TX gain
g_rx = 0                  # RX gain (currently unused)
fs = int(5e6)             # Sampling rate
samples = 2**10           # Samples per frame

# Generate CW signal
amplitude = 2**15
frequency = 1e3
t = np.arange(int(1e5)) / fs
y = amplitude * np.exp(2j * np.pi * frequency * t)
y = np.tile(y, 2)  # Repeat signal

# Pluto SDR TX
tx = adi.ad9363(uri="ip:192.168.1.10")
tx.tx_enabled_channels = [0, 1]
tx.sample_rate = fs
tx.tx_lo = fc
tx.tx_hardwaregain_chan0 = g_tx
tx.tx_hardwaregain_chan1 = g_tx

# Pluto SDR RX
rx = adi.ad9363(uri="ip:192.168.1.10")
rx.rx_enabled_channels = [0, 1]
rx.sample_rate = fs
rx.rx_lo = fc
rx.rx_buffer_size = samples
# rx.rx_hardwaregain_chan0 = g_rx
# rx.rx_hardwaregain_chan1 = g_rx

# Flush RX buffer
for _ in range(10):
    valid = False
    while not valid:
        try:
            _ = rx.rx()
            valid = True
        except Exception:
            time.sleep(0.01)

# Continuous TX/RX Loop
buffer1 = np.zeros((samples, 10), dtype=np.complex64)
buffer2 = np.zeros((samples, 10), dtype=np.complex64)

plt.ion()
fig, ax = plt.subplots()

while True:
    tx.tx(y)
    raw_data = rx.rx()
    ch1 = raw_data[0]
    ch2 = raw_data[1]

    buffer1 = np.roll(buffer1, -1, axis=1)
    buffer1[:, -1] = ch1

    buffer2 = np.roll(buffer2, -1, axis=1)
    buffer2[:, -1] = ch2

    col1 = buffer1.reshape(-1)
    col2 = buffer2.reshape(-1)

    ax.clear()
    ax.plot(np.real(col1), label="Ch1")
    ax.plot(np.real(col2), label="Ch2")
    ax.legend()
    plt.pause(0.01)
