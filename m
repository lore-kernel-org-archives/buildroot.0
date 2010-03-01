From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  1 Mar 2010 18:57:43 +0000 (UTC)
Subject: [Buildroot] [Bug 1207] New: linux26-menuconfig does not apply all
	kernel patches
Message-ID: <bug-1207-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1207

           Summary: linux26-menuconfig does not apply all kernel patches
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will_wagner at carallon.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1171)
 --> (https://bugs.busybox.net/attachment.cgi?id=1171)
fix for linux26-menuconfig

If your target has board specific kernel patches and you do the following:

make linux26clean
make linux26-menuconfig

Then it will not apply your board patches before opening menuconfig. The
attached patch fixes the issue.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
