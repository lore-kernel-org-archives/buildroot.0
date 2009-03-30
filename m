From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Mar 2009 19:51:35 +0000 (UTC)
Subject: [Buildroot] [Bug 239] New: ntfs-3g: convert to Makefile.autotools.in
Message-ID: <bug-239-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=239

              Host: i686-linux
            Target: i686-linux
             Build: i386-pc-linux-gnu
           Summary: ntfs-3g: convert to Makefile.autotools.in
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://lists.busybox.net/pipermail/buildroot/2009-
                    March/026271.html
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: razzor at kopf-tisch.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=205)
 --> (https://bugs.busybox.net/attachment.cgi?id=205)
[PATCH] ntfs-3g: convert to Makefile.autotools.in

- bump version to 2009.03.8
- internal fuse support, no longer depends on libfuse/pkgconfig
- fix WCHAR dependency


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
