# 🧏‍♂️ Sign Language Detector

An easy-to-run Sign Language Recognition app built with **Python**, **OpenCV**, and **MediaPipe**.  
Designed for non-technical users — just **double-click and go**.

---

## 🚀 Quick Start (For Non-Technical Users)

### ✅ What You Need
- A **Windows PC** with **internet access** (only the first time you run it)
- **Python 3.8 – 3.12** installed  
  *(If you don’t have Python, the script will guide you through installing it.)*

---

### 📂 Files Included
Keep all of these files together in the same folder:

| File | Description |
|------|--------------|
| `inference_classifier.py` | The main Sign Language Detector app |
| `model.p` | Pre-trained machine learning model |
| `data.pickle` | Optional dataset file |
| `run_for_client.bat` | ⚡ **Double-click this to install & run automatically** |
| `requirements.txt` | Python dependencies list (installed automatically) |

---

### ▶️ How to Run

1. **Double-click** `run_for_client.bat`
2. If Python isn’t installed, follow the on-screen instructions (check “Add to PATH” when installing)
3. The script will:
   - Create a local Python environment (`.venv`)
   - Install all necessary dependencies automatically
   - Launch the Sign Language Detector

4. When the camera window opens:
   - Show your hand sign in front of the webcam
   - Press **`q`** to quit the app
   - Confirm exit in the console (press **`y`** or **`n`**)

---

### 🕓 First Run Notes
- The first launch may take a few minutes while it installs Python packages (e.g. Mediapipe, OpenCV)
- Future runs will start instantly — everything stays installed locally
- All activity logs are saved to `run_log.txt` in the same folder

---

## 🧠 Troubleshooting

| Issue | Solution |
|--------|-----------|
| **Python not found** | Install Python 3.10 or newer and re-run the `.bat` |
| **mediapipe installation fails** | Use Python **3.10**, which is the most compatible version |
| **No internet** | Ask the sender for a **pre-packaged version** (a ZIP with `.venv` included) |
| **App won’t start or crashes** | Check `run_log.txt` or copy the console output and send it to support |

---

## 💡 Developer Info

**Tech Stack:**
- Python (3.8–3.12)
- OpenCV
- MediaPipe
- scikit-learn
- NumPy

**Main script:**  
`inference_classifier.py` loads the model (`model.p`), uses OpenCV for webcam capture, and MediaPipe for hand tracking.

---

## 🆘 Support

If something doesn’t work:
1. Take a **screenshot** or copy the full console output  
2. Include your:
   - Windows version (e.g. Windows 10 / 11)
   - Python version (shown when the script starts)
3. Send that info to your support contact

---

### ✅ That’s It!
Double-click `run_for_client.bat` and let it handle everything automatically.  
Once installed, you can run it anytime — no setup needed again.

---

Made with ❤️ by Piyush Raj  and Anvay Sharma
(For the DSD Sign Language Project @ VIT Vellore)
