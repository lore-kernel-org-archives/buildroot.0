From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 Sep 2015 02:59:14 +0000 (UTC)
Subject: [Buildroot] [Bug 8341] New: Getting EGL Error: Could not create the
 egl surface: error = 0x300b on RPI-2b board.
Message-ID: <bug-8341-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8341

           Summary: Getting EGL Error: Could not create the egl surface:
                    error = 0x300b on RPI-2b board.
           Product: buildroot
           Version: 2015.05
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: davy2002a at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I am consistently getting a 0x300b error whenever attempting to execute a
custom Qt 5.5.0 application on my Raspberry PI 2 Model B unit, no matter what I
do, I have rebuilt this more then 5x and even did a full rebuild of the code of
both my application and buildroot using "make clean all".

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
