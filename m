From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  7 Jun 2012 12:32:31 +0000 (UTC)
Subject: [Buildroot] [Bug 5294] New: uclibc build ignores target CFLAGS and
	LDFLAGS
Message-ID: <bug-5294-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5294

           Summary: uclibc build ignores target CFLAGS and LDFLAGS
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ioctl at yandex.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When uclibc is building, it does not use flags specified in
BR2_TARGET_OPTIMIZATION and BR2_TARGET_LDFLAGS in .config file.

Is seems inconsistent, accounting the fact, that other target libraries use
them.

BR version 2012.05

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
