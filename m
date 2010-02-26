From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Feb 2010 09:59:32 +0000 (UTC)
Subject: [Buildroot] [Bug 1189] New: Wrong u-boot configuration name for
 integrator926 target
Message-ID: <bug-1189-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1189

           Summary: Wrong u-boot configuration name for integrator926 target
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: johan at thelins.se
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The integrator926_defconfig wants to use the integrator926 configuration for
u-boot. This configuration does not exist, the proper name is integratorcp.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
