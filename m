From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Nov 2009 18:37:23 +0000 (UTC)
Subject: [Buildroot] [Bug 697] New: When I select libusb component,
 the following error occured. If deselect from menuconfig,
 buildroot make process working properly.
Message-ID: <bug-697-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=697

            Target: ARM 920 (AT91RM9200)
             Build: buildroot20091109
           Summary: When I select libusb component, the following error
                    occured. If deselect from menuconfig, buildroot make
                    process working properly.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: peter.stosz at freemail.hu
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


...
checking whether /bin/sh -n is known to work... no
checking for characters that cannot appear in file names... none
checking whether directories can have trailing spaces... yes
checking for expr... /usr/bin/expr
checking for GNU M4 that supports accurate traces... configure: error: no
acceptable m4 could be found in $PATH.
GNU M4 1.4.6 or later is required; 1.4.13 is recommended
make: *** [/srv/buildroot/output/stamps/host_autoconf_configured] Error 1
root at r61:/srv/buildroot# 
root at r61:/srv/buildroot# m4 --version
m4 (GNU M4) 1.4.13
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Rene' Seindal.
root at r61:/srv/buildroot#


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
