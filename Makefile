
PROJECT_NAME = Seguidor_de_linha

SOURCE_DIRECTORY = ./src
BIN_DIRECTORY = ./bin

MAIN_SOURCE_FILE = $(SOURCE_DIRECTORY)/main.c
OBJ_FILE = $(BIN_DIRECTORY)/main.o
OUTPUT_FILE = $(PROJECT_NAME).hex
MCU = atmega328
MCU_SELECTION = -mmcu=$(MCU)

COMPILER = avr-gcc
FLAG_COMPILER = -c

BUILDER = avr-objcopy
FLAG_BUILDER = -j .text -j .data -O

OUTPUT_TYPE = ihex


compile:
	@echo "---------------------------------------------------------"
	@echo "Compilando projeto"
	$(COMPILER) $(MCU_SELECTION) $(FLAG_COMPILER) $(MAIN_SOURCE_FILE)
	@mv ./main.o $(BIN_DIRECTORY)

build:
	@echo "---------------------------------------------------------"
	@echo "Gerando arquivo .HEX"
	$(BUILDER) $(FLAG_BUILDER) $(OUTPUT_TYPE) $(OBJ_FILE) $(OUTPUT_FILE)
	@echo ""

all:
