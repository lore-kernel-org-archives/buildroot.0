From: Ramana <ramana.pureti@spirent.com>
Date: Mon, 10 Oct 2011 17:25:46 -0700
Subject: [Buildroot] help needed on bringing up mips based system using
	buildroot
Message-ID: <1318292746.17371.2.camel@merica>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I am trying to bring up a mips based board (broadcom BCM91250A (SWARM))
and running into a wall. It complains about 'initrd' not found. how do I
link a ramdisk like initrd into the kernel that is being built.

I am using the 'make menuconfig' to configure the setup for the kernel
and can send the .config if needed. 

Any help in this regard is greatly appreciated.

here is the boot log from the system

[RUN!]
Initializing cgroup subsys cpuset
Linux version 2.6.38.7 (root at merica) (gcc version 4.3.5 (Buildroot
2011.05) ) #4
 SMP Wed Oct 5 10:44:45 PDT 2011
bootconsole [early0] enabled
CPU revision is: 00040103 (SiByte SB1)
FPU revision is: 000f0103
Checking for the multiply/shift bug... no.
Checking for the daddiu bug... no.
Broadcom SiByte BCM1125H A4 @ 800 MHz (SB1 rev 3)
Board type: SiByte BCM91250A (SWARM)
Determined physical RAM map:
 memory: 0000000007e97e00 @ 0000000000000000 (usable)
Initrd not found or empty - disabling initrd
Zone PFN ranges:
  DMA32    0x00000000 -> 0x00100000
  Normal   empty
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0: 0x00000000 -> 0x00007e97
Detected 0 available secondary CPU(s)
PERCPU: Embedded 10 pages/cpu @a8000000011c3000 s11232 r8192 d21536
u40960
Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
31963
Kernel command line: root=/dev/ram0 rw
PID hash table entries: 512 (order: 0, 4096 bytes)
Dentry cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
Primary instruction cache 32kB, VIVT, 4-way, linesize 32 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 32 bytes
Memory: 122168k/129628k available (3065k kernel code, 7460k reserved,
922k data,
 208k init, 0k highmem)
Hierarchical RCU
implementation.es;::xGhtrs;rG(sJ]xGhtrs;rG(Sk`Lxzqa`tA028pCcKtK


Regards,

Ramana Pureti

<DIV><FONT size="1">

E-mail confidentiality.
--------------------------------
This e-mail contains confidential and / or privileged information belonging to Spirent Communications plc, its affiliates and / or subsidiaries. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution and / or the taking of any action based upon reliance on the contents of this transmission is strictly forbidden. If you have received this message in error please notify the sender by return e-mail and delete it from your system.

Spirent Communications plc
Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.
Tel No. +44 (0) 1293 767676
Fax No. +44 (0) 1293 767677

Registered in England Number 470893
Registered at Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.

Or if within the US,

Spirent Communications,
26750 Agoura Road, Calabasas, CA, 91302, USA.
Tel No. 1-818-676- 2300 

</FONT></DIV>
