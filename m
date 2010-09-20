From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Sep 2010 15:24:14 +0000 (UTC)
Subject: [Buildroot] [Bug 2617] New: Pixman 0.19.2 & Cairo 1.10.0
Message-ID: <bug-2617-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2617

           Summary: Pixman 0.19.2 & Cairo 1.10.0
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: Paul.Burton at imgtec.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2509
  --> https://bugs.busybox.net/attachment.cgi?id=2509
Update pixman to 0.19.2

Updates pixman & cairo to their current releases. This also exposes the cairo
option to disable some floating point math - since it is actually made use of
in this release.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
