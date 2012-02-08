From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  8 Feb 2012 14:59:55 +0000 (UTC)
Subject: [Buildroot] [Bug 4760] New: Qt: add host-pkg-config to
	dependency-list
Message-ID: <bug-4760-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4760

           Summary: Qt: add host-pkg-config to dependency-list
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4016
  --> https://bugs.busybox.net/attachment.cgi?id=4016
patch

host-pkg-config is needed for building Qt.

Attached patch adds missing dependency.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
