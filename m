From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Oct 2011 08:13:07 +0000 (UTC)
Subject: [Buildroot] [Bug 4333] New: External toolchain installation failed
Message-ID: <bug-4333-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4333

           Summary: External toolchain installation failed
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: laurent.kersten at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3643
  --> https://bugs.busybox.net/attachment.cgi?id=3643
Patch to fix the error

When selecting external toolchain 
The installation process fails.

Build-root head (pulled 18th October 2011)

It turns out that a \ was missing in a "if" clause in the
"toolchain/toolchain-external/ext-tool.mk" file.


The git diff is joined as an attachment

/ Laurent

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
