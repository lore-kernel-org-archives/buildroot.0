From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  4 Nov 2011 19:17:34 +0000 (UTC)
Subject: [Buildroot] [Bug 4448] New: Busybox build must depend on busybox
 configuration file date
Message-ID: <bug-4448-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4448

           Summary: Busybox build must depend on busybox configuration
                    file date
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fenixk19 at mail.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Busybox build must depend on busybox configuration file date.

If you change busybox configuration file and remake buildroot, it won't rebuild
busybox. So you need to manually delete output/build/busybox* dir to make it
recompiled.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
