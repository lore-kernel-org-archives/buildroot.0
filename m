From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2009 13:40:13 +0000 (UTC)
Subject: [Buildroot] [Bug 561] New: ltp-testsuite failed to install
Message-ID: <bug-561-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=561

              Host: Intel Core 2 Duo 32bit Mandriva Linux
            Target: generic_arm
           Summary: ltp-testsuite failed to install
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: oduclos at mandriva.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.3


Here is what I got when trying to generate an image for ARM with Linux 2.6.29
and ltp-testsuite using buildroot 2009.08-rc2.

Applying ltp-testsuite-enable-openposix-for-nptl.patch using plaintext: 
patching file testcases/Makefile
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- saving rejects to file testcases/Makefile.rej

Can I remove this patch safely ?

Also, because of the patch "ltp-testsuite-generate-needs-bash.patch" we should
add bash as a dependency of ltp-testsuite.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
