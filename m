From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Sep 2009 21:30:57 +0000 (UTC)
Subject: [Buildroot] [Bug 605] New: [PATCH] Enhancement of libglib2 package
Message-ID: <bug-605-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=605

           Summary: [PATCH] Enhancement of libglib2 package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rvpaasen at t3i.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=645)
 --> (https://bugs.busybox.net/attachment.cgi?id=645)
libglib2 patch

Some applications have switched to glib2 (for example mpd). To keep the
footprint of the rootfs small, it is convenient to only include the necessary
glib libs.

This patch adds an option to the libglib2 package that allows just a selection
of libraries to be installed (some of glib, gio, gmodule, gobject, gthread).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
