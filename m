From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Apr 2012 08:03:15 +0000 (UTC)
Subject: [Buildroot] [Bug 5072] New: ncurses: add ncurses-progs to target
Message-ID: <bug-5072-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5072

           Summary: ncurses: add ncurses-progs to target
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: All
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tech at davengo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4262
  --> https://bugs.busybox.net/attachment.cgi?id=4262
Patch

Added support for compiling and installing ncurses-progs to the target.
Adds clear, tput, tic, toe, tset and infocmp to the target.

Build tested on i686 architecture.

Best regards,
Stefan Mei?ner, davengo GmbH, Germany

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
