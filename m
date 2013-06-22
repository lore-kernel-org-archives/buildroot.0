From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Jun 2013 21:23:56 +0000 (UTC)
Subject: [Buildroot] [Bug 6326] New: Dropbear: Add options to allow better
 config for different target devices (e.g. routers)
Message-ID: <bug-6326-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6326

              Host: any
            Target: any
             Build: buildroot 2013.05
           Summary: Dropbear: Add options to allow better config for
                    different target devices (e.g. routers)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: patch
          Severity: enhancement
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mail at maddes.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4952
  --> https://bugs.busybox.net/attachment.cgi?id=4952
Patch (-p1) to add more buildroot options for Dropbear package.

Multiple embedded devices targets do not allow to put files everywhere,
therefore paths and commands must be adopted to the given file system.
Additionally the current make file changes the path of the xauth command in the
background instead of providing an config option.
The attached patch (-p1) adds four buildroot options to the Dropbear package,
so it's config can be adopted to any given situation.
Please apply for a future release.

Kind regards
Maddes

P.S.:
Bugzilla does not know the current stable release of buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
