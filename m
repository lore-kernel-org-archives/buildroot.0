From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  4 May 2010 17:04:43 +0000 (UTC)
Subject: [Buildroot] [Bug 1681] New: Cross-compiled binaries should be
 installed into staging
Message-ID: <bug-1681-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1681

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Cross-compiled binaries should be installed into
                    staging
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1633
  --> https://bugs.busybox.net/attachment.cgi?id=1633
Lua: don't install binaries into staging dir

Some packages install cross-compiled binaries into the staging dir.
This is wrong since they could predate host tools in the PATH and usually
aren't host-executable anyway.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
