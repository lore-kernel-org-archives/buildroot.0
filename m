From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Oct 2009 11:33:22 +0000 (UTC)
Subject: [Buildroot] [Bug 657] New: Bug in imagemagick-clean target
Message-ID: <bug-657-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=657

              Host: -
            Target: -
             Build: -
           Summary: Bug in imagemagick-clean target
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.1


imagemagick-clean target currently tries to remove $(TARGET_DIR) as there is no
IMAGEMAGICK_BINARY anymore.

Attached patch solves this issue...

Simon Pasch


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
