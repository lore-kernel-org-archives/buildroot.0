From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Dec 2010 05:26:41 +0000 (UTC)
Subject: [Buildroot] [Bug 3013] New: make menuconfig fails with
	buildroot-2010.11
Message-ID: <bug-3013-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3013

           Summary: make menuconfig fails with buildroot-2010.11
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hrm-junk at att.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Running "make menuconfig" fails with the following script:

mkdir -p /data/Temp/buildroot-2010.11/output/build/buildroot-config/lxdialog
make CC="/usr/bin/gcc"
obj=/data/Temp/buildroot-2010.11/output/build/buildroot-config -C
package/config -f Makefile.br mconf
make[1]: Entering directory `/data/Temp/buildroot-2010.11/package/config'
Makefile:299: *** invalid syntax in conditional.  Stop.
make[1]: Leaving directory `/data/Temp/buildroot-2010.11/package/config'
make: *** [/data/Temp/buildroot-2010.11/output/build/buildroot-config/mconf]
Error 2


The system is OpenSuSE 11.2, x86, 32 bit, and has gcc 4.4-4.2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
