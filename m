From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Nov 2011 16:47:58 +0000 (UTC)
Subject: [Buildroot] [Bug 4568] New: Added initscript for avahi-autoipd
Message-ID: <bug-4568-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4568

           Summary: Added initscript for avahi-autoipd
           Product: buildroot
           Version: 2011.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tilman.baumann at grandeye.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3830
  --> https://bugs.busybox.net/attachment.cgi?id=3830
Adds initscript-for-avahi-autoipd

I needed avahi-autoipd running so I created a initscript.

Two things I like to add to make it nicer but would need some pointers.
A list of interfaces to monitor settable via Kconfig.
Command line options settable via KConfig. (I need --force-bind)

But it's usable like that. (See patch)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
