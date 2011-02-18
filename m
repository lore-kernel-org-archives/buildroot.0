From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 07:32:29 +0000 (UTC)
Subject: [Buildroot] [Bug 3283] New: See why nfs-utils needs fakeroot,
 and convert to autotools
Message-ID: <bug-3283-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3283

           Summary: See why nfs-utils needs fakeroot, and convert to
                    autotools
           Product: buildroot
           Version: 2010.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The nfs-utils package does strange things so that "make install" is run as root
under fakeroot. As the package has not been upgraded in any significant way
since its introduction in january 2007, we probably need to upgrade it, convert
the package to the appropriate infrastructure, and see if the fakeroot thing
can be removed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
