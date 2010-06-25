From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Jun 2010 02:36:51 +0000 (UTC)
Subject: [Buildroot] [Bug 2107] New: New package: input-event-daemon
Message-ID: <bug-2107-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2107

           Summary: New package: input-event-daemon
           Product: buildroot
           Version: 2010.05
          Platform: All
               URL: http://github.com/gandro/input-event-daemon
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: keguang.zhang at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2089
  --> https://bugs.busybox.net/attachment.cgi?id=2089
Add new package: input-event-daemon

input-event-daemon is a daemon which executes a user-defined command on input
events, such as keys, mouse buttons and switches.
This can be useful to handle special keys on laptops or multimedia keyboards
without X11.

See: http://github.com/gandro/input-event-daemon

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
