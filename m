From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2009 15:39:39 +0000 (UTC)
Subject: [Buildroot] [Bug 565] New: libevent: Bump version and clean up
	makefile.
Message-ID: <bug-565-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=565

           Summary: libevent: Bump version and clean up makefile.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=595)
 --> (https://bugs.busybox.net/attachment.cgi?id=595)
Bump libevent version from 1.2 to 1.4.12.

The current version of libevent is more than 2 years old. This patch bumps the
version to a much more recent one and cleans up the makefile to use the
Makefiles.autotools.in rules.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
