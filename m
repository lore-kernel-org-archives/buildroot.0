From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Jul 2009 11:02:58 +0000 (UTC)
Subject: [Buildroot] [Bug 475] New: uImage target for U-boot failed
	generating
Message-ID: <bug-475-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=475

              Host: i386-pc-linux-gnu
            Target: powerpc-unknown-linux-gnu
             Build: i386-pc-linux-gnu
           Summary: uImage target for U-boot failed generating
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: etienne_lorrain at yahoo.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=487)
 --> (https://bugs.busybox.net/attachment.cgi?id=487)
all config leading to the error

BOOTCC  arch/powerpc/boot/fdt_rw.o
  BOOTCC  arch/powerpc/boot/fdt_strerror.o
  BOOTAR  arch/powerpc/boot/wrapper.a
  WRAP    arch/powerpc/boot/uImage
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/linux-2.6.30.2/arch/powerpc/boot/wrapper:
line 261: mkimage: command not found
make[2]: *** [arch/powerpc/boot/uImage] Error 127
make[1]: *** [uImage] Error 2
make[1]: Leaving directory
`/home/elorrain/buildroot/project_build_powerpc/Eqam4G/linux-2.6.30.2'
make: *** [/home/elorrain/buildroot/binaries/Eqam4G/uImage] Error 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
