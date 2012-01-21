From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 21 Jan 2012 23:13:03 +0000 (UTC)
Subject: [Buildroot] [Bug 4718] New: python (built for powerpc) distutils
 has paths to host compiler toolchain
Message-ID: <bug-4718-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4718

           Summary: python (built for powerpc) distutils has paths to host
                    compiler toolchain
           Product: buildroot
           Version: 2011.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bvwelch at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I suspect that I probably missed somewhere that I could have set this up, and I
think I can workaround it using distutil.cfg, but I was surprised that when I
ran "python setup.py build_ext --inplace", the errors were showing path names
from the host where I ran buildroot, rather than my native powerpc toolchain.

Otherwise, buildroot is working great, thank you!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
