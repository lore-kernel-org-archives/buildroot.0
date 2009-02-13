From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Feb 2009 09:57:40 +0000 (UTC)
Subject: [Buildroot] [Bug 107] New: convert libvorbis to
	Makefile.autotools.in
Message-ID: <bug-107-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=107

           Summary: convert libvorbis to Makefile.autotools.in
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at phase-zero.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=65)
 --> (https://bugs.busybox.net/attachment.cgi?id=65)
patch to make libvorbis.mk use Makefile.autotools.in

Attached is a patch that converts libvorbis.mk to use Makefile.autotools.in.
This is not only simpler, it also fixes a problem I had with wrong library
paths in the libvorbis*.la files in the staging dir.

I suggest to apply this patch before dealing with bug #101.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
