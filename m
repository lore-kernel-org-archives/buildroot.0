From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  5 Aug 2015 10:43:26 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] New: pointing to /usr/bin/objcopy old
 version (x86) instead of the generated one
Message-ID: <bug-8256-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

           Summary: pointing to /usr/bin/objcopy old version (x86) instead
                    of the generated one
           Product: buildroot
           Version: 2015.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: christophebricout at yahoo.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


using the default configuration file to target MINNOWMAX board, buildroot
unable to generate x86_64 binary as gmake process points to the host
/usr/bin/objcopy (i586 architecture) and not the copyobj generated in the
output directory.

Is a option available?
Best Regards

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
