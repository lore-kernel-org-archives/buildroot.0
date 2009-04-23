From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 23 Apr 2009 11:21:07 +0000 (UTC)
Subject: [Buildroot] [Bug 301] New: allow to install libsmbclient
Message-ID: <bug-301-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=301

           Summary: allow to install libsmbclient
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
   Estimated Hours: 0.0


Created an attachment (id=263)
 --> (https://bugs.busybox.net/attachment.cgi?id=263)
patch to add BR2_PACKAGE_SAMBA_LIBSMBCLIENT option

The libsmbclient library is part of the samba package. It can be used to build
applications that access Samba shares without the need to mount them. Currently
the library is explicitly not installed by buildroot. Here's a patch that adds
a config option to install it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
