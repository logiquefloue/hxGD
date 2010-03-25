
NEKOPATH=/usr/lib/neko/include/

CC=gcc
CFLAGS=-Wall -shared -I$(NEKOPATH)
BINDING=-lgd

OUT=nGD.ndll

all: nGD src/nGDImage.o src/nGDDraw.o src/nGDFile.o src/nGD.o src/nGDCopy.o
	$(CC) $(CFLAGS) $(BINDING) src/nGDImage.o src/nGDDraw.o src/nGDFile.o src/nGD.o src/nGDCopy.o -o $(OUT)
	
nGD: src/nGD.o nGDFile

nGDFile: src/nGDFile.o nGDImage

nGDDraw: src/nGDDraw.o nGDImage

nGDCopy: src/nGDCopy.o nGDImage

nGDImage: src/nGDImage.o

clean:
	rm -f src/*.o
	
force:
	touch src/*.c

haxe:
	haxe build.hxml
	
run:
	neko test1.n