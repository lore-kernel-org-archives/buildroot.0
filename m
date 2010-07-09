From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  9 Jul 2010 06:25:28 +0000 (UTC)
Subject: [Buildroot] [Bug 2191] New: linux-fusion build fail
Message-ID: <bug-2191-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2191

           Summary: linux-fusion build fail
           Product: buildroot
           Version: 2010.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jordan.pan.yh at renesas.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

My buildroot version is 2010.05. When I enable linux-fusion package in the
build list, below error will appear ---

-------------
make[1]: Entering directory
`/opt/projects/bsp-v3.0.2-retw/src/buildroot-2010.05/output/build/linux-fusion-8.1.1'
make[1]: *** No rule to make target `headers_install'.  Stop.
make[1]: Leaving directory
`/opt/projects/bsp-v3.0.2-retw/src/buildroot-2010.05/output/build/linux-fusion-8.1.1'
------------

Review the make option for the linux-fusion package, there is no
headers_install option in the Makefile.

My build target is for SHx processor. To confirm it is the same issue, then I
rebuild the buildroot with ARM processor again. The result is same.

Does anybody know how to fix it?

Thanks & Best Regards
Jordan

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
