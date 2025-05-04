 Jailbreak Project Plan — Semi-Rootfull RPAC-based Jailbreak for iOS 16.0–18.3

⸻

Project Overview:

A semi-rootfull jailbreak targeting iOS 16.0–18.3 devices affected by the RPAC exploit, achieving:
	•	tfp0 (task-for-pid-0)
	•	AMFI patching (disable code-signing enforcement)
	•	Custom TrustCache injection
	•	Bootstrap installation (CoreBinpack or custom)
	•	Optional Control Center module and UI daemon

⸻

Main Components:
	1.	RPAC Exploit Integration
	•	Implement the RPAC exploit to achieve arbitrary kernel read/write primitives.
	•	Use this to gain tfp0 by modifying task_struct privileges for the current process.
	•	Recommended base: RPAC PoC

 
	2.	tfp0 Acquisition
	•	Using RPAC’s kernel primitive, locate and patch:
	•	task_for_pid entitlement or modify task flags to grant tfp0.
	•	Alternatively locate task_self and adjust its ipc_space->is_table privileges.

 
	3.	AMFI/CS Enforcement Bypass
	•	Patch AMFI via kernel memory write:
	•	Disable cs_enforcement flags.
	•	Patch trust cache list or dynamically load a new TrustCache into kernel.
	•	Patch amfid’s trust verification routine if necessary.

 
	4.	Custom TrustCache Injection
	•	Generate a custom trustcache binary containing SHA256 hashes of unsigned binaries/apps.
	•	Inject into kernel’s trustcache linked list via RPAC’s kernel primitives.

 
	5.	Bootstrap Installation
	•	Mount a writable root filesystem snapshot.
	•	Extract and install a core bootstrap (CoreBinpack or custom directory).
	•	Create required directories: /var/jb, /var/bin, /var/containers.
	•	Install essential utilities (uicache, sbreload, launchctl).

 
	6.	Persistence (Optional)
	•	Semi-rootfull means no untether, but an optional persistent userland app can be added for convenience re-jailbreaking.

 
	7.	Control Center Module / Daemon
	•	Optionally develop a CCSupport module to toggle jailbreak services (e.g., tweak loader or daemon management) directly from Control Center.

Project Structure Proposal
RPACJailbreak/
├── src/
│   ├── main.m
│   ├── exploit/
│   │   └── rpac.m
│   ├── kernel/
│   │   ├── tfp0.m
│   │   ├── amfi_patch.m
│   │   └── trustcache_loader.m
│   └── bootstrap/
│       └── installer.m
├── trustcache/
│   └── trustcache.bin
├── offsets/
│   └── offsets.json
├── Makefile
└── control


RPAC Exploit Requirements
	•	Kernel read/write primitives via RPAC.
	•	Identify kernel base, kernel slide, kernel task port.
	•	Patch relevant task structures for tfp0.
	•	Optionally patch macOS’ equivalent codesign enforcement if needed.


Recommended Tools/Dependencies

•	RPAC PoC as base for exploit
	•	TrustCache generator (C tool)
	•	CoreBinpack or Procursus bootstrap


 Notes
	•	Works semi-rootfully; tweaks loaded via /var/jb.
	•	AMFI patching done in-kernel, no amfid replacement needed.
	•	Re-jailbreak via app or trigger upon reboot.
	•	No KTRR bypass required.



 

 
