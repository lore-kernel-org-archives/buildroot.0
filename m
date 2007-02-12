From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:10 -0800
Subject: [Buildroot] [buildroot 0000546]: make menuconfig is incomplete;
	some config options get asked on 'make'
Message-ID: <7d8c380be943151bb7412df868fd2621@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=546 
====================================================================== 
Reported By:                alemc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   546
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-15-2005 23:29 PST
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    make menuconfig is incomplete; some config options
get asked on 'make'
Description: 
The following config options are not set my make menuconfig, resulting in
the settings for these questions being asked when doing 'make'

Target x86 Processor Family
> 1. Generic 386 (CONFIG_GENERIC_386) (NEW)
  2. 386 (CONFIG_386) (NEW)
  3. 486 (CONFIG_486) (NEW)
  4. Pentium/586/K5/5x86/6x86/6x86MX (CONFIG_586) (NEW)
  5. Pentium-MMX (CONFIG_586MMX) (NEW)
  6. Pentium-Pro (CONFIG_686) (NEW)
  7. Celeron/Pentium-II (CONFIG_PENTIUMII) (NEW)
  8. Pentium-III/Celeron(Coppermine)/Pentium-III Xeon (CONFIG_PENTIUMIII)
(NEW)
  9. Pentium-4/Celeron(P4-based)/Xeon (CONFIG_PENTIUM4) (NEW)
  10. K6/K6-II/K6-III (CONFIG_K6) (NEW)
  11. Athlon/Duron/K7 (CONFIG_K7) (NEW)
  12. Elan (CONFIG_ELAN) (NEW)
  13. Crusoe (CONFIG_CRUSOE) (NEW)
  14. Winchip-C6 (CONFIG_WINCHIPC6) (NEW)
  15. Winchip-2/Winchip-2A/Winchip-3 (CONFIG_WINCHIP2) (NEW)
  16. CyrixIII/VIA-C3 (CONFIG_CYRIXIII) (NEW)
  17. VIA C3-2 (Nehemiah) (CONFIG_NEHEMIAH) (NEW)
choice[1-17?]: 

  Shared library loader naming prefix (LDSO_BASE_FILENAME) [ld.so] ld.so
  Enable ELF RUNPATH tag support (LDSO_RUNPATH) [Y/n/?] (NEW) 

Attemt to shutdown stdio subsystem when abort() is called.
(UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT) [N/y/?] (NEW) 

Build pthread with debugging output (DODEBUG_PT) [N/y/?] (NEW)


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-15-05 23:29  alemc          New Issue                                    
11-15-05 23:29  alemc          Status                   new => assigned     
11-15-05 23:29  alemc          Assigned To               => uClibc          
01-23-06 12:36  prpplague      Status                   assigned => resolved
01-23-06 12:36  prpplague      Resolution               open => fixed       
01-23-06 12:36  prpplague      Additional Information Updated                   

03-08-06 16:55  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
