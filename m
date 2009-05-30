From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 30 May 2009 06:03:03 +0000 (UTC)
Subject: [Buildroot] [Bug 361] New: linux kernel configuration choice works
	incorrectly
Message-ID: <bug-361-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=361

             Build: 2009.05-rc3
           Summary: linux kernel configuration choice works incorrectly
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Mac OS
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hans.johnson at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When the advanced kernel configuration is chosen, and the user selects a
configuration, it is not run as expected.  Selecting menuconfig results in the
scripts not running any configurator (causes an error on an initial build, as
no .config exists) and selecting xconfig causes menuconfig to run.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
