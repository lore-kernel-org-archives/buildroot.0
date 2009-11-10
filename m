From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Nov 2009 17:25:38 +0000 (UTC)
Subject: [Buildroot] [Bug 707] New: Can`t configure fltk-1.1.7 . configure:
 error: Configure could not find required X11 libraries
Message-ID: <bug-707-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=707

              Host: Linux server 2.6.31-rt11 #3 SMP Sun Sep 20 21:36:34 MSD
                    2009 x86_64 GNU/Linux
            Target: Linux ARM
             Build: Buildroot git
           Summary: Can`t configure fltk-1.1.7 . configure: error: Configure
                    could not find required X11 libraries
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: assemble-failure
          Severity: normal
          Priority: P1
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: petka.sokolov at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=735)
 --> (https://bugs.busybox.net/attachment.cgi?id=735)
Config for Buildroot and config log fltk-1.1.7

Hi!
Can`t configure fltk-1.1.7

Console out:
checking for X... no
configure: error: Configure could not find required X11 libraries
./configure: line 10022: exit: aborting.: numeric argument required
./configure: line 10022: exit: aborting.: numeric argument required
make: *** [/opt/src/linux-arm/build/fltk-1.1.7/.stamp_configured] ??????
255

Bye.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
