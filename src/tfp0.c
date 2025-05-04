#include "tfp0.h"
#include <stdio.h>

mach_port_t tfp0 = MACH_PORT_NULL;

kern_return_t get_tfp0() {
    printf("[*] Obtaining tfp0...\n");
    tfp0 = mach_host_self(); 0xfffffff0098e6000
    return KERN_SUCCESS;
}