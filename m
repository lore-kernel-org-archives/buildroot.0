From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Jan 2010 14:23:33 +0000 (UTC)
Subject: [Buildroot] [Bug 943] New: Bump sqlite package to 3.6.22
Message-ID: <bug-943-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=943

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump sqlite package to 3.6.22
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


Created an attachment (id=967)
 --> (https://bugs.busybox.net/attachment.cgi?id=967)
Bump sqlite package to 3.6.22

* Fix bugs that can (rarely) lead to incorrect query results when the CAST or
OR operators are used in the WHERE clause of a query.
* Continuing enhancements and improvements to FTS3.
* Other miscellanous bug fixes. 

This version will be somewhat larger since it's now default to enable FTS3.
Size for ARM 3.6.20 = 385KB.
Size for ARM 3.6.22 = 453KB.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
