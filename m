From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Jul 2009 13:03:29 +0000 (UTC)
Subject: [Buildroot] [Bug 495] New: Bump bind package to 9.5.1-P3 (security)
Message-ID: <bug-495-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=495

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump bind package to 9.5.1-P3 (security)
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-
                    0696
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=511)
 --> (https://bugs.busybox.net/attachment.cgi?id=511)
Security bump bind to 9.5.1-P3

Current bind (9.5.1-P2) is vulnerable to CVE-2009-0696:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-0696
A simple bump to 9.5.1-P3 fixes this.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
