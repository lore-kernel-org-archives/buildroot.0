From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  3 Jun 2010 20:13:16 +0000 (UTC)
Subject: [Buildroot] [Bug 1951] New: Bump openssl to 0.9.8o
Message-ID: <bug-1951-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1951

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump openssl to 0.9.8o
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1897
  --> https://bugs.busybox.net/attachment.cgi?id=1897
Bump openssl to 0.9.8o

Openssl 0.9.8o fixes some (non-relevant) security issues:
http://www.openssl.org/news/secadv_20100601.txt
Also enable MDC2 (patent expired), Camellia (royalty-free) and tlsext while
we're at it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
