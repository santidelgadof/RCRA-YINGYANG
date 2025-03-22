import clingo
import sys

### Main program

if len(sys.argv)<4:
    print("decode.py yinyang.lp domfile.lp solfile.txt")
    sys.exit()

# Loading files and grounding
ctl = clingo.Control()
ctl.add("base", [], "size(n).")
for arg in sys.argv[1:-1]:
    ctl.load(arg)
ctl.ground([("base", [])])
out = open(sys.argv[3], "w")
sys.stdout = out

# Solving    
size=0
circles=[]
with ctl.solve(yield_=True) as handle:
  print("Resolviendo", file=sys.stderr)
  for model in handle:
      for atom in model.symbols(atoms=True):
          if (atom.name=="gridsize" 
          and len(atom.arguments)==1 
          and atom.arguments[0].type is clingo.SymbolType.Number):
            size=atom.arguments[0].number
          elif (atom.name=="_drawcircle"
          and len(atom.arguments)==3):
              circles.append((atom.arguments[0].number,atom.arguments[1].number,
                              atom.arguments[2].name))
      grid=[['.' for x in range(size)] for y in range(size)]
      for c in circles:
         if c[2]=='black':
            grid[c[0]][c[1]]='1'
         elif c[2]=='white':
            grid[c[0]][c[1]]='0'
      for l in grid:
         for c in l:
            print(c,end="")
         print("")
      out.close()
      exit()

