#import <Foundation/Foundation.h>
#include "exploit.h"
#include "tfp0.h"
#include "amfi.h"
#include "trustcache.h"
#include "bootstrap.h"

int main(int argc, char *argv[]) {
    @autoreleasepool {
        printf("[*] Starting DopamineRPACJB...\n");

        if (run_rpac_exploit() != KERN_SUCCESS) {
            printf("[-] Exploit failed.\n");
            return -1;
        }

        if (get_tfp0() != KERN_SUCCESS) {
            printf("[-] Failed to get tfp0.\n");
            return -1;
        }

        disable_amfi();
        load_trustcache();
        install_bootstrap();

        printf("[+] Jailbreak Done!\n");
    }
    return 0;
}