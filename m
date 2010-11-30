From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Nov 2010 19:53:02 +0000 (UTC)
Subject: [Buildroot] [Bug 2869] New: Do not erase source and build
 directories from the linux kernel build.
Message-ID: <bug-2869-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2869

           Summary: Do not erase source and build directories from the
                    linux kernel build.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mroberto at cpti.cetuc.puc-rio.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2743
  --> https://bugs.busybox.net/attachment.cgi?id=2743
Patch to keep the "source" and "build" directories in the linux tree.

When buiding and installing a package that compiles an out-of-the-tree
kernel module, it is necessary to have the "source" and "build"
directories on the linux kernel tree. This patch avoids the deletion
of these directories in linux.mk.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
