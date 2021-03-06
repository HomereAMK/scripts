#!/usr/bin/python
# encoding: utf-8
# author: Charles Joly Beauparlant
# 2012-08-23

"""
usage:
keep_hsapiens.py singletonFilename filename.fa
"""

class Printer:
	def __init__ (self, singletonName):
		self.printing = False
		self.singletonList = []
		for id in open(singletonName):
			self.singletonList.append(id.strip())

	def parseLine(self, line):
		if '>' in line:
			tokens = line.strip().split()
			if tokens[0][1:] not in self.singletonList:
				self.printing = True
				print line.strip()
			else:
				self.printing = False
		else:
			if self.printing == True:
				print line.strip()


import sys

if __name__ == "__main__":
	if len(sys.argv) != 3:
		print __doc__
		sys.exit(1)

	singletonName=sys.argv[1]
	printer = Printer(singletonName)
	filename=sys.argv[2]
	for line in open(filename):		
		printer.parseLine(line)
