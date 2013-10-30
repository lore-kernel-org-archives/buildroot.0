From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 09:46:48 +0000 (UTC)
Subject: [Buildroot] [Bug 6632] New: CMake use host pkg-config
Message-ID: <bug-6632-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6632

           Summary: CMake use host pkg-config
           Product: buildroot
           Version: 2013.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: damien at zeetim.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Dear All,

I try to add cairo-dock in buildroot but I have a problem with CMAKE based
package.

When I try to compile a CMAKE based package, cmake use the /usr/bin/pkg-config
instead of the one compiled by buildroot.
So pkg-config look for package on host and not in buildroot directory.

Is there any solution to force cmake to use the correct pkg-config and find
dependencies ?

Best regards

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
