From: ccku <ccku1025@gmail.com>
Date: Tue, 25 Aug 2009 18:36:16 +0800
Subject: [Buildroot] buildroot for arm with nommu
Message-ID: <90a1645d0908250336o34a0bc45lcf0d9b8a949e01a1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi,

I'm using buildroot try to build a rootfile. (buildroot-2009.08-rc2)
My ARM cpu is nommu, but I can't get the rootfile as BFLT format, it always
generate ELF format,

Thanks for you help in advance.

the following is the basic setting

%make menuconfig
Target Architecture = arm
Target Architecture Variant = generic_arm
Target ABI = EABI
ToolChain / [*] Enable elf2flt support


%make uclibc-menuconfig
Target Architecture (arm)
Target Architecture Features and Options
    Target ABI (EABI)
    Target Processor Type (Generic Arm)
    Target File Format (STATIC FLAT)
    Target Processor Endianness (Little Endian)
     [ ] Target CPU has a memory management unit (MMU)
     [*] Enable floating point number support
     [ ]   Target CPU has a floating point unit (FPU)
     [*]   Enable full C99 math library support
     [ ]   Enable C99 Floating-point environment

%make
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090825/cca1b0ea/attachment.htm>
