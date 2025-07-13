<<<<<<< HEAD
# AntiDot
=======
# AntiDot
# Installation
1. Please Install all 3 files
1.a. https://code.visualstudio.com/docs/?dv=win64user
1.b. https://github.com/analogdevicesinc/libiio/releases/tag/v0.25 - libiio-0.25.gb6028fd-setup.exe
1.c. https://www.python.org/ - Dowloads->python 3.13.5
2. Open VS Code
3. Press CTRL+Shift+P
4. Type Terminal: Select Default Profile
5. Choose Command Prompt
6. On the left toolbar downlaod these Extensions: C/C++,CMakem tools, GitHub CoPilot, GitHub Pull Request, Jupyter, Python, Python Debugger
7. Open Terminal by pressing CTRL+`
Note - terminal should be CMD now and not powershell
8. Open project Directory
9. Connect to Our Git by - git clone https://github.com/DorMalka/AntiDot.git (signing into GitHub might be requested)
Note: now you suppose to be at AntiDot directory
10. create environment - python -m venv venv
11. activate environment - venv\Scripts\activate
Note: Now your path shold be appear with (venv) in the beginning
12. pip install pylibiio
13. pip show pylibiio - to Validate the installation succeeded Name, Version and Location should be appeared.
14. run python start.py
Note: In case no Pluto SDR connected, you should receive: OSError: [Errno 0] No error
In case of other Error - please contact me
15. Try to change something small in ReadMe and Commit+Push so we can validate working parallelism
Note: Commit+Push is done via left toolbar In Source Control. Edited files will be appeared under Changes.
Click + to Stage and Commit
After clicking commit a Commit message will be opened. right your commit message and then close the window. 
After closing window the commit will be initiated.
>>>>>>> 5fb8306 (editing installation instructions)
