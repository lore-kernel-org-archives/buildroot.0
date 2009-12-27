From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 27 Dec 2009 17:47:53 +0000 (UTC)
Subject: [Buildroot] [Bug 829] New: Webkit r44552 needs libXt
Message-ID: <bug-829-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=829

              Host: i686-linux-gnu
            Target: i686-linux-uclibc
             Build: i686-linux-uclibc
           Summary: Webkit r44552 needs libXt
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dandart at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I tried to compile (host has Xt with dev headers), but Webkit still doesn't
compile, maybe due to it being compiled before X (I specified TinyX).

checking for XtOpenDisplay in -lXt... no
configure: error: X Toolkit Intrinsics library (libXt) not found
make: ***
[/home/dan/xenon/buildroot/output/build/webkit-r44552/.stamp_configured] Error
1


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
