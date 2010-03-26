From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Mar 2010 13:24:23 +0000 (UTC)
Subject: [Buildroot] [Bug 1411] New: [SECURITY] Update openssl package to
	0.9.8n
Message-ID: <bug-1411-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1411

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: [SECURITY] Update openssl package to 0.9.8n
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1375)
 --> (https://bugs.busybox.net/attachment.cgi?id=1375)
[SECURITY] Bump openssl to 0.9.8n

openssl-0.9.8n fixes vulnerabilities:
http://nvd.nist.gov/nvd.cfm?cvename=CVE-2009-3245 (from <= 0.9.8l)
http://nvd.nist.gov/nvd.cfm?cvename=CVE-2010-0433 (from <= 0.9.8m)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
