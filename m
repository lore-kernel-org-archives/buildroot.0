From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Jul 2010 14:00:42 +0000 (UTC)
Subject: [Buildroot] [Bug 2263] New: Bump samba to 3.3.13 [CVE-2010-2063]
Message-ID: <bug-2263-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2263

              Host: i686-linux
            Target: powerpc-uclibc
           Summary: Bump samba to 3.3.13 [CVE-2010-2063]
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://www.samba.org/samba/security/CVE-2010-2063
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2263
  --> https://bugs.busybox.net/attachment.cgi?id=2263
Bump samba to 3.3.13 [CVE-2010-2063]

Bump samba package to version 3.3.13.
Security fixes CVE-2010-2063 (memory corruption vulnerability).
Tested on a ppc target.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
