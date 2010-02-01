From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  1 Feb 2010 17:02:27 +0000 (UTC)
Subject: [Buildroot] [Bug 1015] New: [SECURITY] Bump bind to 9.5.1-P2
Message-ID: <bug-1015-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1015

              Host: i686-linux
            Target: arm-softfloat-linux
           Summary: [SECURITY] Bump bind to 9.5.1-P2
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1021)
 --> (https://bugs.busybox.net/attachment.cgi?id=1021)
Bump bind to 9.5.1-P2

CVE-2009-4022: BIND 9 Cache Update From Additional Section
CVE-2010-0097: BIND 9 DNSSEC Validation Code Could Cause Bogus NXDOMAIN
Responses

All previous versions of bind are vulnerable.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
