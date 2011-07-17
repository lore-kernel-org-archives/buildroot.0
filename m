From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 Jul 2011 02:07:09 +0000 (UTC)
Subject: [Buildroot] [Bug 3985] New: "help" target's defconfig list needs
	sort
Message-ID: <bug-3985-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3985

           Summary: "help" target's defconfig list needs sort
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d_mo1234 at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3481
  --> https://bugs.busybox.net/attachment.cgi?id=3481
patch file to add sort to "help" target's defconfig list

The latest "make" version, 3.82, changed the behavior of "wildcard" to no
longer sort its output.  The result is that the defconfig list in buildroot's
"help" target now lists things in some bizarro order.  Not good for those of us
who manage multiple configurations.  It would help if a "sort" were added.  A
patch is attached.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
