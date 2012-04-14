From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 14 Apr 2012 11:54:23 +0000 (UTC)
Subject: [Buildroot] [Bug 5102] New: qt package moc, uic,
	rcc read from wrong place
Message-ID: <bug-5102-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5102

           Summary: qt package moc, uic, rcc read from wrong place
           Product: buildroot
           Version: 2012.02
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mehsamadi at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


when cross compiling qt, building application with cross compiled qmake creates
a wrong location for moc, uic, and rcc in Makefile.
qmake expect finding moc in host/usr/arm-unknown-linux-uclibcgnueabi/usr/bin/
while the actual files are located in the host/usr/bin/

I compiled this with 2011.11 and it was ok. I guess this is something that is
introduced in 2012.02.

Thank you
sorry for bad english. :-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
