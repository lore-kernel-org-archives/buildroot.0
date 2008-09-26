From: Dirk Vermaak <dirk.vermaak@ntlworld.com>
Date: Fri, 26 Sep 2008 11:57:19 +0100
Subject: [Buildroot] SAM9260 Kernel Menuconfig Problem
Message-ID: <200809261157.19932.dirk.vermaak@ntlworld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I was wondering if anybody else has seen the following problem and has any 
idea of the solution. The problem appears to occur almost at random and 
doesn't seem to follow any pattern.

I have the buildroot system specified on the Linux4Sam website and all works 
fine. We have built the kernel many times. However, sometimes if I go 
into "make menuconfig" at the Kernel level and then do a make the config 
system runs and insists on changing my architecture. If I select AT91 (see 
menu below)  it only allows me the  RM9200 option. 

If I go back into the Kernel menuconfig all the architecture stuff seems to be 
ok. Has anyone else seen this problem or know of a fix for it.

* System Type
*
ARM system type
  1. Agilent AAEC-2000 based (ARCH_AAEC2000) (NEW)
  2. ARM Ltd. Integrator family (ARCH_INTEGRATOR) (NEW)
  3. ARM Ltd. RealView family (ARCH_REALVIEW) (NEW)
> 4. ARM Ltd. Versatile family (ARCH_VERSATILE) (NEW)
  5. Atmel AT91 (ARCH_AT91) (NEW)
  6. Cirrus CL-PS7500FE (ARCH_CLPS7500) (NEW)
  7. Cirrus Logic CLPS711x/EP721x-based (ARCH_CLPS711X) (NEW)
  8. Co-EBSA285 (ARCH_CO285) (NEW)
  9. EBSA-110 (ARCH_EBSA110) (NEW)
  10. EP93xx-based (ARCH_EP93XX) (NEW)
  11. FootBridge (ARCH_FOOTBRIDGE) (NEW)
  12. Hilscher NetX based (ARCH_NETX) (NEW)
  13. Hynix HMS720x-based (ARCH_H720X) (NEW)
  14. IMX (ARCH_IMX) (NEW)
  15. IOP13xx-based (ARCH_IOP13XX) (NEW)
  16. IOP32x-based (ARCH_IOP32X) (NEW)
  17. IOP33x-based (ARCH_IOP33X) (NEW)
  18. IXP23XX-based (ARCH_IXP23XX) (NEW)
  19. IXP2400/2800-based (ARCH_IXP2000) (NEW)
  20. IXP4xx-based (ARCH_IXP4XX) (NEW)
  21. LinkUp-L7200 (ARCH_L7200) (NEW)
  22. Micrel/Kendin KS8695 (ARCH_KS8695) (NEW)
  23. NetSilicon NS9xxx (ARCH_NS9XXX) (NEW)
  24. Freescale MXC/iMX-based (ARCH_MXC) (NEW)
  25. Philips Nexperia PNX4008 Mobile (ARCH_PNX4008) (NEW)
  26. PXA2xx/PXA3xx-based (ARCH_PXA) (NEW)
  27. RiscPC (ARCH_RPC) (NEW)
  28. SA1100-based (ARCH_SA1100) (NEW)
  29. Samsung S3C2410, S3C2412, S3C2413, S3C2440, S3C2442, S3C2443 
(ARCH_S3C2410) (NEW)
  30. Shark (ARCH_SHARK) (NEW)
  31. Sharp LH7A40X (ARCH_LH7A40X) (NEW)
  32. TI DaVinci (ARCH_DAVINCI) (NEW)
  33. TI OMAP (ARCH_OMAP) (NEW)
choice[1-33]: 5
*
* Boot options
*
*
* Power management
*
*
* Atmel AT91 System-on-Chip
*
Atmel AT91 Processor
> 1. AT91RM9200 (ARCH_AT91RM9200) (NEW)
  2. AT91SAM9260 or AT91SAM9XE (ARCH_AT91SAM9260) (NEW)
  3. AT91SAM9261 (ARCH_AT91SAM9261) (NEW)
  4. AT91SAM9263 (ARCH_AT91SAM9263) (NEW)
  5. AT91SAM9RL (ARCH_AT91SAM9RL) (NEW)
  6. AT91CAP9 (ARCH_AT91CAP9) (NEW)
  7. AT91x40 (ARCH_AT91X40) (NEW)
choice[1-7]: 1
*
* AT91RM9200 Board Type
*
Ajeco 1ARM Single Board Computer (MACH_ONEARM) [N/y/?] (NEW) 
