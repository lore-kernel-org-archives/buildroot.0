From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2015 03:55:50 +0000 (UTC)
Subject: [Buildroot] [Bug 8116] New: 2015.05-rc2 raspberrypi2_defconfig
 network interface not coming up
Message-ID: <bug-8116-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8116

           Summary: 2015.05-rc2 raspberrypi2_defconfig network interface
                    not coming up
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: albert.david at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


in 2015.05-rc2, default configuration of raspberrypi2(raspberrypi2_defconfig)
network interface doesnt show up after boot, but adding a "sleep 1" in
S40network(before line "/sbin/ifup -a") fixes the problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
