From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2009 13:35:46 +0000 (UTC)
Subject: [Buildroot] [Bug 513] New: Add new squid package
Message-ID: <bug-513-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=513

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Add new squid package
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://www.squid-cache.org
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=525)
 --> (https://bugs.busybox.net/attachment.cgi?id=525)
Add squid package

Caching proxy for HTTP, HTTPS and FTP.
This package disables HTCP, WCCP and SNMP AgentX support in squid to keep the
binary as small as possible.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
