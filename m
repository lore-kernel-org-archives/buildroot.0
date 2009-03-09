From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Mar 2009 17:13:41 +0000 (UTC)
Subject: [Buildroot] [Bug 161] New: vim fails on patching with errors in
	configure.patch
Message-ID: <bug-161-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=161

           Summary: vim fails on patching with errors in configure.patch
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: igor47 at moomers.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


1 out of 423 hunks FAILED -- saving rejects to file src/auto/configure.rej
Patch failed!  Please fix configure.patch!
make: *** [/provisioning/buildroot/buildroot-2009.02/build_i686/vim71/.patched]
Error 1

the earlier error is:
misordered hunks! output would be garbled
Hunk #399 FAILED at 14947.

removing that hunk from the patch file only causes additional errors.
i couldn't fix this, but after the error simply touch vim71/.patched and
continuing on with the make seems to be a usable workaround.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
