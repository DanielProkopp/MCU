
PROJECT_NAME = Seguidor_de_linha

SOURCE_DIR = ./src
BIN_DIR = ./bin
OBJ_DIR = ./obj

MAIN_SOURCE_FILE = $(SOURCE_DIR)/main.c
OBJ_FILE = $(OBJ_DIR)/main.o
BIN_FILE = $(BIN_DIR)/$(PROJECT_NAME).elf
OUTPUT_FILE = $(PROJECT_NAME).hex

MCU = atmega328
MCU_SELECT = -mmcu=$(MCU)


COMPILER = avr-gcc
OTIMIZE = -Os
CFLAGS = -g  -Wall -Werror -Wextra 
GEN_OBJ = $(CFLAGS) $(MCU_SELECT) -c $(MAIN_SOURCE_FILE) $(OTIMIZE)
GEN_BIN = -g $(MCU_SELECT) -o $(BIN_FILE) $(OBJ_FILE)

BUILDER = avr-objcopy
FLAG_BUILDER = -j .text -j .data -O
OUTPUT_TYPE = ihex

PROGRAMMER = avrdude
PROGRAMMER_MCU = m328p
BAUD= 19200
PROGRAMMER_TYPE = arduino
PROGRAMMER_SERIAL_PORT = /dev/serial/by-id/usb-Arduino__www.arduino.cc__0043_85534313837351C030E1-if00

MEMORY_TYPES=calibration eeprom efuse flash fuse hfuse lfuse lock signature application apptable boot prodsig usersig




compile:
	@echo "---------------------------------------------------------"
	@echo "                 Compilando projeto"
	@echo "---------------------------------------------------------"
	@echo "Gerando arquivo objeto: "
	$(COMPILER) $(GEN_OBJ)
	@mv main.o $(OBJ_DIR)
	@echo "Gerando arquivo binario: "
	$(COMPILER) $(GEN_BIN)
	@echo ""	
	

build:
	@$(MAKE) compile
	@echo "---------------------------------------------------------"
	@echo "Gerando arquivo .HEX"
	$(BUILDER) $(FLAG_BUILDER) $(OUTPUT_TYPE) $(BIN_FILE) $(OUTPUT_FILE)
	@echo ""


flash:
	$(PROGRAMMER) -p$(PROGRAMMER_MCU) -c$(PROGRAMMER_TYPE) -P$(PROGRAMMER_SERIAL_PORT) -v$(baud) -v -U flash:w:$(OUTPUT_FILE)

all:
	make build
