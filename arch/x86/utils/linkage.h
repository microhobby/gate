#ifndef _BOOT_GATE_LINKAGE_H
#define _BOOT_GATE_LINKAGE_H

#ifndef ENTRY
#define ENTRY(name) \
	name:
#endif

#ifndef ENDPROC
#define ENDPROC(name) \
	ret
#endif

#endif
