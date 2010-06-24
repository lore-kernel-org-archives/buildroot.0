From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jun 2010 12:05:38 +0000 (UTC)
Subject: [Buildroot] [Bug 2101] New: blackbox depends on locale support
Message-ID: <bug-2101-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2101

           Summary: blackbox depends on locale support
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jsteckli at os.inf.tu-dresden.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Steps to repeat:
 1. Checkout git head
 2. Enable WCHAR support, but not locales
 3. Enable blackbox
 4. make
-> config of blackbox fails with missing iconv

Workaround:
 Select locale support.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
