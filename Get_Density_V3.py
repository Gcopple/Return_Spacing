import os
import time
import sys

file_name = "Density_and_Spacing.txt"
print(file_name)
if os.path.exists("Spacing_Only.txt"):
    os.remove("Spacing_Only.txt")
    print("Old spacing file removed, Creating new file.")
else:
    print("Creating file")
with open(file_name, "r") as f:
    lines = f.readlines()
    for X in lines:
        if "spacing:" in X:
            with open("Spacing_Only.txt", "a") as of:
                Spacing_List = X.split(" ")
                print(Spacing_List)
                Spacing = Spacing_List[Spacing_List.index("only") + 1]
                of.write(Spacing + '\n')
print("File has been created. Thank you.")
time.sleep(5)
