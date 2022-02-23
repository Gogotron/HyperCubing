import sys

with open(sys.argv[1]) as f:
	text = f.read()
lines = text.split("\n")
puzzle_lines = lines[1:121]
pieces = [[line[i:i+2] for i in range(0,len(line),2)] for line in puzzle_lines]
puzzle = {cell[0]:cell[1:] for cell in pieces}

stickers_solved = sum(surround.count(center) for center, surround in puzzle.items())
cells_solved = sum(all(piece==center for piece in surround) for center, surround in puzzle.items())

def visualize():
	for cell in puzzle:
		print(cell,'|',''.join('X' if cell==i else ' ' for i in puzzle[cell]),'|',sep='')

#visualize()
print(f"Solved {stickers_solved} stickers out of {120*62}")
print(f"That is {100*stickers_solved/(120*62):.6}%")
print(f"Solved {cells_solved} cells out of 120")
