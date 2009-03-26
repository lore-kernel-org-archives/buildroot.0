From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Mar 2009 14:04:45 +0000 (UTC)
Subject: [Buildroot] [Bug 217] New: Bump openssl package to 0.9.8k (security)
Message-ID: <bug-217-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=217

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump openssl package to 0.9.8k (security)
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://www.openssl.org/news/secadv_20090325.txt
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Bump the openssl package from 0.9.8j to 0.9.8k, fixes various security issues.
Affected by CVE-2009-0590, CVE-2009-0591, CVE-2009-0789.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
