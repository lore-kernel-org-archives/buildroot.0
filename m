From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Feb 2012 04:32:39 +0000 (UTC)
Subject: [Buildroot] [Bug 4772] New: Add uClibc configuration file option to
 crosstool-ng toolchain support
Message-ID: <bug-4772-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4772

           Summary: Add uClibc configuration file option to crosstool-ng
                    toolchain support
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: andrew at sideramota.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Currently when selecting a crosstool-ng-uClibc toolchain you cannot specify the
uClibc config file as it is always written over by the default. This patch adds
an option to the menuconfig to specify an alternative.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
