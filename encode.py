# encode.py
# Transforma domXX.txt en domXX.lp

import sys

if len(sys.argv) < 2:
    print("Uso: python3 encode.py domXX.txt")
    sys.exit()

input_file = sys.argv[1]
output_file = input_file.replace(".txt", ".lp")

with open(input_file) as f:
    lines = [line.strip() for line in f if line.strip()]

n = len(lines)

with open(output_file, "w") as f:
    f.write(f"gridsize({n}).\n")
    for y, line in enumerate(lines):
        for x, char in enumerate(line):
            f.write(f"cell({y},{x}).\n")
            if char == "0":
                f.write(f"init({y},{x},white).\n")
            elif char == "1":
                f.write(f"init({y},{x},black).\n")
