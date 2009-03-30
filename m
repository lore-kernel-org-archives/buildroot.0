From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Mar 2009 19:49:08 +0000 (UTC)
Subject: [Buildroot] [Bug 237] New: ncftp: convert to Makefile.autotools.in
Message-ID: <bug-237-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=237

              Host: i686-linux
            Target: i686-linux
             Build: i386-pc-linux-gnu
           Summary: ncftp: convert to Makefile.autotools.in
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://lists.busybox.net/pipermail/buildroot/2009-
                    March/026269.html
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: razzor at kopf-tisch.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


- ncftpspooler is just a link to ncftpbatch
- only ncftpbookmarks needs ncurses, also change from "depends" to "select"


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
