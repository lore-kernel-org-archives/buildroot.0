From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Feb 2009 00:34:21 +0000 (UTC)
Subject: [Buildroot] [Bug 111] New: binutils 2.17 fails to build when
	texinfo >= 4.10
Message-ID: <bug-111-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=111

              Host: openSESE 11.1
            Target: mipsel
             Build: 2009.02-rc4
           Summary: binutils 2.17 fails to build when texinfo >= 4.10
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: luke_tucker at yahoo.co.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The configure script of binutils 2.17 tries to detect whether makeinfo is later
than v4.4 however it does not take into account minor versions with double
digits so v4.12 fails the test and stops binutils building even though the
texinfo verion is valid.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
