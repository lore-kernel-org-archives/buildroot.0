From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Apr 2009 10:37:59 +0000 (UTC)
Subject: [Buildroot] [Bug 279] New: update libglib2 to version 2.20.1
Message-ID: <bug-279-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=279

           Summary: update libglib2 to version 2.20.1
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P4
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at phase-zero.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=235)
 --> (https://bugs.busybox.net/attachment.cgi?id=235)
patch to bump the libglib2 version

GLib 2.20 stable release

March 16, 2009

GLib 2.20 is a stable release adding an incremental improvement in
functionality over GLib 2.18 while maintaining binary and source compatibility.

Major new features include:

    * Optimizations of GHashTable and GMarkup
    * Support for in-place decoding of base64 strings
    * When launching applications, always pass fuse file:// uris whe possible,
      and let gio convert such uris back to gio uris. This can be turned off
      using the X-GIO-NoFuse desktop file key.
    * GIO has a concept of ?shadowed? mounts


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
