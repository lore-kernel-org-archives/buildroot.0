From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 29 Jun 2009 10:57:01 +0000 (UTC)
Subject: [Buildroot] [Bug 427] New: webkit: Update to WebKit svn r44552.
Message-ID: <bug-427-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=427

           Summary: webkit: Update to WebKit svn r44552.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
        Depends on: 425
   Estimated Hours: 0.0


Created an attachment (id=429)
 --> (https://bugs.busybox.net/attachment.cgi?id=429)
Update WebKit to svn r44552.

- Fix generation of configure script and Makefiles.
 - Add dependencies on libsoup and enchant.
 - Allow configuration of rendering target (currently X11 or DirectFB).

This may close bug 355, but I haven't been able to reproduce the specific issue
in that report.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
