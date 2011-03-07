From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Mar 2011 16:12:17 +0000 (UTC)
Subject: [Buildroot] [Bug 3421] New: nano: make tiny flag optional
Message-ID: <bug-3421-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3421

           Summary: nano: make tiny flag optional
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: info at daccii.it
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3109
  --> https://bugs.busybox.net/attachment.cgi?id=3109
patch

By default nano is compiled with --enable-tiny. I've added a option to make
this configurable.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
