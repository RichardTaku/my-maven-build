import tkinter as tk
from tkinter import messagebox

def on_button_click():
    """Function to execute when the button is clicked."""
    messagebox.showinfo("Read Me", "This is a simple Tkinter application!")

# 1. Create the main window
root = tk.Tk()
root.title("Simple GUI App")

# 2. Create the heading (Label widget)
# padx and pady add internal padding around the text
welcome_label = tk.Label(
    root,
    text="Welcome",
    font=("Arial", 24, "bold"),  # Set font size and style
    padx=20,
    pady=10
)
# Place the label in the window
welcome_label.pack()

# 3. Create the button
read_me_button = tk.Button(
    root,
    text="Click Read Me",
    command=on_button_click,  # Link the button to the function
    font=("Arial", 16),
    padx=10,
    pady=5
)
# Place the button in the window
read_me_button.pack(pady=10) # Add external padding below the button

# 4. Start the main event loop
# This keeps the window open and responsive
root.mainloop()
