import tkinter as tk
from tkinter import ttk
import pyautogui
import threading
import time
import keyboard

# ==================== SPAM MESSAGES ====================
SPAM_MESSAGES = [
    "1/_/_/_/_/_/_/_//_/_/_/_/_/_/_//_/_/_/_/_/_//_/_/__//_/_/_/_/_/_/_/_/_/_/_/_/_/_///_/_/__/__/_//_/_/_LEXA PAPA YHA HAI _/_/_/_/_/_/_/_/_/_/_/_/_/_//_/_/_/_/_/_//_/_/_/_/_//_",
    "2.@@@@@@_@@@@@@__@@@@@@@__@#@@@@@@@@_@@@@__@___##_@@_@_@_@_@_@__@ H8RS LEAVE MARDE 😂 @_@_@_@_@_@_@_@_@_@_@_@_@",
    "3. _ _ _ _ _ ===_ _ _ _  _ _ _ _ _ ===_ _ _ _  _ _ _ _ _ ===_ _ _ _  _ _ _ _ _ ===_ _ _ _  _ _ _ _ _ ===_ _ _ _ LEXA H8RS CUD 🥀 _ _ _ _ _ ===_ _ _ _  _ _ _ _ _ ===_ _ _ _ ",
    "4. _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ -LEXA H8RS TERE ME MERA LUN  _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ _ _ _ _ ===_ _ _ _  _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ - _ -"
]

# ==================== GLOBAL VARIABLES ====================
spamming = False
current_index = 0
spam_thread = None

# ==================== SPAM FUNCTION ====================
def spam_loop():
    global spamming, current_index
    while spamming:
        try:
            msg = SPAM_MESSAGES[current_index % len(SPAM_MESSAGES)]
            # Clipboard me copy karke paste karega
            root.clipboard_clear()
            root.clipboard_append(msg)
            root.update()
            
            # Ctrl+V se paste karega (fast spam)
            pyautogui.hotkey('ctrl', 'v')
            pyautogui.press('enter')
            
            current_index += 1
            time.sleep(0.3)  # Speed adjust kar sakta hai
        except Exception as e:
            print(f"Error: {e}")
            break

# ==================== START / STOP ====================
def toggle_spam():
    global spamming, spam_thread, current_index
    if not spamming:
        spamming = True
        current_index = 0
        start_btn.config(text="⏹ STOP SPAM", bg="#e74c3c")
        status_label.config(text="● SPAMMING...", fg="#2ecc71")
        spam_thread = threading.Thread(target=spam_loop, daemon=True)
        spam_thread.start()
    else:
        spamming = False
        start_btn.config(text="▶ START SPAM", bg="#27ae60")
        status_label.config(text="● STOPPED", fg="#e74c3c")

# ==================== MINIMIZE FUNCTION ====================
def minimize_gui():
    root.iconify()

# ==================== CLOSE FUNCTION ====================
def close_gui():
    global spamming
    spamming = False
    root.destroy()

# ==================== DRAG WINDOW ====================
def start_drag(event):
    root.x = event.x
    root.y = event.y

def drag_window(event):
    x = root.winfo_pointerx() - root.x
    y = root.winfo_pointery() - root.y
    root.geometry(f"+{x}+{y}")

# ==================== GUI SETUP ====================
root = tk.Tk()
root.title("LEXA SPAMMER")
root.geometry("320x420")
root.configure(bg="#1a1a2e")
root.overrideredirect(True)  # Borderless
root.attributes("-topmost", True)  # Always on top

# Center the window
screen_w = root.winfo_screenwidth()
screen_h = root.winfo_screenheight()
x = (screen_w // 2) - 160
y = (screen_h // 2) - 210
root.geometry(f"320x420+{x}+{y}")

# ==================== TITLE BAR ====================
title_bar = tk.Frame(root, bg="#16213e", height=35)
title_bar.pack(fill="x")
title_bar.pack_propagate(False)

title_label = tk.Label(
    title_bar, text="⚡ LEXA PAPA SPAMMER ⚡",
    bg="#16213e", fg="#00fff7",
    font=("Arial", 10, "bold")
)
title_label.pack(side="left", padx=10)

# Minimize button
min_btn = tk.Button(
    title_bar, text="—", command=minimize_gui,
    bg="#f39c12", fg="white", bd=0,
    font=("Arial", 12, "bold"), width=3, cursor="hand2"
)
min_btn.pack(side="right", padx=(0, 2), pady=5)

# Close button
close_btn = tk.Button(
    title_bar, text="✕", command=close_gui,
    bg="#e74c3c", fg="white", bd=0,
    font=("Arial", 10, "bold"), width=3, cursor="hand2"
)
close_btn.pack(side="right", padx=2, pady=5)

# Drag support
title_bar.bind("<Button-1>", start_drag)
title_bar.bind("<B1-Motion>", drag_window)
title_label.bind("<Button-1>", start_drag)
title_label.bind("<B1-Motion>", drag_window)

# ==================== MAIN CONTENT ====================
main_frame = tk.Frame(root, bg="#1a1a2e")
main_frame.pack(fill="both", expand=True, padx=15, pady=15)

# Status
status_label = tk.Label(
    main_frame, text="● READY", fg="#f39c12",
    bg="#1a1a2e", font=("Arial", 11, "bold")
)
status_label.pack(pady=(0, 10))

# Rotate indicator
rotate_label = tk.Label(
    main_frame, text="🔄 Rotating: 4 Messages",
    bg="#1a1a2e", fg="#00fff7", font=("Arial", 9)
)
rotate_label.pack(pady=(0, 15))

# Start Button
start_btn = tk.Button(
    main_frame, text="▶ START SPAM", command=toggle_spam,
    bg="#27ae60", fg="white", bd=0,
    font=("Arial", 12, "bold"), height=2, cursor="hand2"
)
start_btn.pack(fill="x", pady=5)

# Speed control
speed_label = tk.Label(
    main_frame, text="⚡ Spam Speed (seconds)",
    bg="#1a1a2e", fg="#aaaaaa", font=("Arial", 9)
)
speed_label.pack(pady=(15, 5))

speed_var = tk.DoubleVar(value=0.3)
speed_scale = tk.Scale(
    main_frame, from_=0.1, to=2.0, resolution=0.1,
    orient="horizontal", variable=speed_var,
    bg="#1a1a2e", fg="#00fff7", troughcolor="#16213e",
    highlightthickness=0, bd=0, length=250
)
speed_scale.pack()

# Info
info = tk.Label(
    main_frame, text="⚠ Use in Free Fire chat/input box",
    bg="#1a1a2e", fg="#888888", font=("Arial", 8, "italic")
)
info.pack(pady=(10, 0))

# ==================== HOTKEYS ====================
def setup_hotkeys():
    keyboard.add_hotkey('f8', toggle_spam)
    keyboard.add_hotkey('f9', minimize_gui)
    keyboard.add_hotkey('f10', close_gui)

threading.Thread(target=setup_hotkeys, daemon=True).start()

# ==================== RUN ====================
root.mainloop()
