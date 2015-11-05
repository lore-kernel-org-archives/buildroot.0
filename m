From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Nov 2015 19:45:08 +0000 (UTC)
Subject: [Buildroot] [Bug 8436] New: xserver_xorg-server Segmentation fault
Message-ID: <bug-8436-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8436

           Summary: xserver_xorg-server Segmentation fault
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: buildroot at netsolux.ch
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,

xserver_xorg-server crash when using Dillo or Midori.

See : https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63346

xserver_xorg-server should never be built with the -Os option (default option).

The server works when compiled with -O3 option.

Best regards,

Thomas

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
