# AntiDot

## Stage 1: Install Required Software

1. Please install all 3 files:
   - https://code.visualstudio.com/docs/?dv=win64user
   - https://github.com/analogdevicesinc/libiio/releases/tag/v0.25  
     ↳ Download: `libiio-0.25.gb6028fd-setup.exe`
   - https://www.python.org/  
     ↳ Go to Downloads → Python 3.13.5

---

## Stage 2: Open VS Code and Configure Terminal

2. Open VS Code  
3. Press `Ctrl + Shift + P`  
4. Type `Terminal: Select Default Profile`  
5. Choose **Command Prompt**

---

## Stage 3: Install Extensions

6. From the left toolbar, install the following extensions:
   - C/C++
   - CMake Tools
   - GitHub CoPilot
   - GitHub Pull Request
   - Jupyter
   - Python
   - Python Debugger

---

## Stage 4: Open Terminal

7. Open the terminal by pressing: `Ctrl + \`` (backtick)  
   ➤ Make sure the terminal now uses **CMD** and not PowerShell.

---

## Stage 5: Clone the Project from GitHub

8. Open the folder where you want the project  
9. Clone the Git repository:
   git clone https://github.com/DorMalka/AntiDot.git

## Stage 6: Create and Activate the Python Environment

10. Create the environment:

    python -m venv venv

11. Activate the environment:

    venv\Scripts\activate

**Note:** Once activated, your terminal path should begin with `(venv)`.

---

## Stage 7: Install pylibiio and Validate Installation

12. Install the required package:

    pip install pylibiio
    pip install pyadi-iio
    pip install matplotlib 

13. Validate the installation succeeded:

    pip show pylibiio

**You should see:**
- Name  
- Version  
- Location  

If all three appear — the installation was successful.

---

## Stage 8: Run the Project and Push a Test Commit

14. Run the main script:

    python pluto_2t_2r.py

**Note:**  
- If no Pluto SDR is connected, you should see:  
  `OSError: [Errno 0] No error` → This is expected  
- If any **other error** appears, please contact me.

---

15. Test Git collaboration by editing and pushing a change:

Try editing something small in the `README.md`, then commit and push the change.

**Steps to Commit + Push in VS Code:**

- Go to the **Source Control** tab (left toolbar)
- Your edited files will appear under **Changes**
- Click the `+` next to the file to **Stage** it
- Click the **✓** to **Commit**
- A commit message window will open  
  → Write your message and **close the window**
- The commit will now be saved
- Click **Sync Changes** or run:

    git push

---

✅ If you reach this point, everything is working correctly — the project is running, Git is syncing, and your environment is ready.
