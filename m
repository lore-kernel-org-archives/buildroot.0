From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Oct 2013 01:51:06 +0000 (UTC)
Subject: [Buildroot] [Bug 6626] New: procps Unknown HZ value! (XX) Assume
	100.
Message-ID: <bug-6626-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6626

           Summary: procps Unknown HZ value! (XX) Assume 100.
           Product: buildroot
           Version: 2013.08
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cassiano at idbinfo.com.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Procps suite is goes nuts with my mips64 board. the problem seem harmless, as I
read from the gentoo forums. All binaries included in procps suite show the
same message "Unknown HZ value! (XX) Assume 100.", like top, ps, uptime, et
all.

Attached is a patch from the gentoo, which seems to solve this. it works fine
for x86 and mips64 as I tested.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
