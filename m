From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 25 Aug 2013 05:25:23 +0000 (UTC)
Subject: [Buildroot] [Bug 6464] New: dbus-daemon-launch-helper needs setuid
Message-ID: <bug-6464-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6464

           Summary: dbus-daemon-launch-helper needs setuid
           Product: buildroot
           Version: 2013.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bluemrp9 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


dbus complains about dbus-daemon-launch-helper not being setuid from the
default install.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
