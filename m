From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 23 Apr 2009 11:24:07 +0000 (UTC)
Subject: [Buildroot] [Bug 303] New: add gvfs package
Message-ID: <bug-303-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=303

           Summary: add gvfs package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at phase-zero.de
                CC: buildroot at uclibc.org
        Depends on: 299,301
   Estimated Hours: 0.0


Created an attachment (id=265)
 --> (https://bugs.busybox.net/attachment.cgi?id=265)
Config.in for gvfs

gvfs is a userspace virtual filesystem where mount runs as a separate processes
which you talk to via D-Bus. It also contains a gio module that seamlessly adds
gvfs support to all applications using the gio API. It also supports exposing
the gvfs mounts to non-gio applications using fuse.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
