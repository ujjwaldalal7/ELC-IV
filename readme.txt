# Real-Time Cartoonify - ELC Project (MATLAB)

## Project Title:
Real-Time Cartoonifying an Video using Computer Vision in MATLAB

## Author:
Name: Ujjwal Dalal  
Roll No: 102303093  
Branch: COE  
Thapar Institute of Engineering and Technology, Patiala

---

## How to Run:

1. Open MATLAB.
2. Place the file `cartoonify.m` in your working directory.
3. Connect your system's webcam.
4. Run the script by typing:
   >> cartoonify
   OR
   by by clicking 'RUN' 
5. A live cartoonified video feed will appear.
6. Press **Ctrl+C** in the command window to stop safely.
7. Type 'clear all' in command window to stop accessing the camera.
---

## Requirements:

- MATLAB (R2022a)
- **Image Processing Toolbox**
- Working webcam

---

## Description:

This project applies real-time image processing to cartoonify each frame captured by the webcam. It combines:
- **Bilateral filtering** to smooth flat regions
- **Color quantization** to simulate artistic color styles
- **Canny edge detection** to extract cartoon-style outlines
- A safe and responsive real-time display

---

## Output:

- The live cartoonified video feed is displayed in a MATLAB figure window.
- The program handles errors and user interruptions gracefully.

---

## Files Included:

- `cartoonify.m` - Main MATLAB script
- `report.docx` - Final report for submission
- `presentation.pptx` - ELC presentation slides
- `readme.txt` - This instruction file

---

## Submission Notes:

- Demonstration video should record a working session of this live cartoonify effect.
- Ensure clear visibility of input and output windows in your demo.

