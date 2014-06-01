From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  1 Jun 2014 17:16:27 +0000 (UTC)
Subject: [Buildroot] [Bug 7142] New: ecryptfs needs getent to run
Message-ID: <bug-7142-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7142

           Summary: ecryptfs needs getent to run
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: xxiao8 at fosiao.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


glibc/eglibc has getent built automatically, it should be copied to target root
filesystem for package ecryptfs to run.
uclibc has a getent under extra/scripts which emulates getenv in glibc/eglibc.
there might be other packages need getent, which is small in size, I would
suggest always put that to target rootfs?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
