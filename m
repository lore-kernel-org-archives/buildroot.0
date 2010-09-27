From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 Sep 2010 10:07:33 +0000 (UTC)
Subject: [Buildroot] [Bug 2647] New: makedevs package lacks support for
 16-bit major/minor numbers
Message-ID: <bug-2647-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2647

           Summary: makedevs package lacks support for 16-bit major/minor
                    numbers
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: matt at console-pimps.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The attached patch adds support for creating device nodes with 16-bit
major/minor numbers.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
