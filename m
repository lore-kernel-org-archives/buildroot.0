From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 22:47:04 +0000 (UTC)
Subject: [Buildroot] [Bug 6644] New: "all" target doesn't work in
	out-of-tree builds
Message-ID: <bug-6644-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6644

           Summary: "all" target doesn't work in out-of-tree builds
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rjbarnet at rockwellcollins.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I'm unable to do the following command sequence when utilizing out-of-tree
builds:

# make clean all
make: Nothing to be done for `all'.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
