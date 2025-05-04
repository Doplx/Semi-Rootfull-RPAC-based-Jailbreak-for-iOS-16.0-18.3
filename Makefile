ARCHS = arm64e
TARGET = iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TOOL_NAME = DopamineRPACJB

DopamineRPACJB_FILES = src/main.m src/exploit.c src/tfp0.c src/amfi.c src/trustcache.c src/bootstrap.c
DopamineRPACJB_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tool.mk