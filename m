From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Aug 2009 13:32:41 +0000 (UTC)
Subject: [Buildroot] [Bug 527] New: misc fixes for dnsmasq package
Message-ID: <bug-527-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=527

              Host: Ubuntu 9.0.4 Server 32 Bit
            Target: i686
             Build: i686
           Summary: misc fixes for dnsmasq package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d.albano at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

i've fixed some stuff into dnsmasq package:
- paths in dbus support
- dbus dependencies
- make doesn't take into account ldflags

Now it compiles fine, but i haven't yet tested it (actually i can't)

I'm attacching four patches, because the fourth replaces spaces with tabs for
dbus path support fix


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
