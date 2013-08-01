From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Aug 2013 19:42:18 +0000 (UTC)
Subject: [Buildroot] [Bug 6410] New: omap3_beagle has uimage error load
	address error
Message-ID: <bug-6410-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6410

           Summary: omap3_beagle has uimage error load address error
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hans.stimer at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5000
  --> https://bugs.busybox.net/attachment.cgi?id=5000
.config file used for make

Version of buildroot: head as of 31/7/2013.

When specifying

  BR2_TARGET_UBOOT_BOARDNAME="omap3_beagle"

make produces this error:

  Kernel: arch/arm/boot/Image is ready
  Kernel: arch/arm/boot/zImage is ready
multiple (or no) load addresses: 
This is incompatible with uImages
Specify LOADADDR on the commandline to build an uImage
make[2]: *** [arch/arm/boot/uImage] Error 1
make[1]: *** [uImage] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
