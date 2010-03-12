From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 12 Mar 2010 15:13:45 +0000 (UTC)
Subject: [Buildroot] [Bug 1267] New: Wrong BR2_EXTRA_VERSION
Message-ID: <bug-1267-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1267

           Summary: Wrong BR2_EXTRA_VERSION
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: serj.kalichev at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1201)
 --> (https://bugs.busybox.net/attachment.cgi?id=1201)
BR2_EXTRA_VERSION patch

Buildroot version 2010.02. (Bugtracker does not have 2010.02 version choice)

I try to build kernel with custom version number (2.6.33). The full version of
kernel become something like "2.6.332.6.33". And the modules dir is
/lib/modules/2.6.332.6.33.

The target/linux/Config.in.advanced contain wrong default for
BR2_EXTRA_VERSION.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
