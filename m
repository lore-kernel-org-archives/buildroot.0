From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  3 Dec 2009 16:28:55 +0000 (UTC)
Subject: [Buildroot] [Bug 773] New: [SECURITY] Update bind to 9.5.2-P1
Message-ID: <bug-773-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=773

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: [SECURITY] Update bind to 9.5.2-P1
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-
                    4022
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=805)
 --> (https://bugs.busybox.net/attachment.cgi?id=805)
Update bind to 9.5.2-P1

Unspecified vulnerability in ISC BIND 9.4 before 9.4.3-P4, 9.5 before 9.5.2-P1,
9.6 before 9.6.1-P2, 9.7 beta before 9.7.0b3, and 9.0.x through 9.3.x with
DNSSEC validation enabled and checking disabled (CD), allows remote attackers
to conduct DNS cache poisoning attacks via additional sections in a response
sent for resolution of a recursive client query, which is not properly handled
when the response is processed "at the same time as requesting DNSSEC records
(DO)."


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
