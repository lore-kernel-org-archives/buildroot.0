From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Mar 2010 02:31:46 +0000 (UTC)
Subject: [Buildroot] [Bug 1387] New: xlib_libX11-1.3.2 can's find libjpeg
Message-ID: <bug-1387-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1387

              Host: X86_64
            Target: ARM
             Build: buildroot-git
           Summary: xlib_libX11-1.3.2 can's find libjpeg
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paul.jones at iwtech.com.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1357)
 --> (https://bugs.busybox.net/attachment.cgi?id=1357)
Buildroot config

X.Org should select jpeg, but for whatever reason it didn't. When I selected it
manually it didn't appear to get built before it was needed by X11.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
