From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 12 Dec 2009 23:01:25 +0000 (UTC)
Subject: [Buildroot] [Bug 797] New: add libplayer package
Message-ID: <bug-797-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=797

           Summary: add libplayer package
           Product: buildroot
           Version: 2009.11
          Platform: PC
               URL: http://libplayer.geexbox.org/
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: caytchen at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=825)
 --> (https://bugs.busybox.net/attachment.cgi?id=825)
patch based on 2009.11

This adds libplayer version 1.0.0. See the homepage for detailed information.
Package has been tested for avr32, both build and execution, and given its
simplicity, should work on any platform.

Note that, since there is no xine package in buildroot yet, it's not possible
to select xine as a wrapper in menuconfig, even though support has been
prepared in the makefile.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
