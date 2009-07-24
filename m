From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 24 Jul 2009 13:51:31 +0000 (UTC)
Subject: [Buildroot] [Bug 487] New: Make kismet package sexier
Message-ID: <bug-487-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=487

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Make kismet package sexier
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=499)
 --> (https://bugs.busybox.net/attachment.cgi?id=499)
Make kismet package sexier

* Bump kismet from 2007-10-R1 to 2009-06-R1 (newcore: nicer, more features)
* Migrate to Makefile.autotools.in
* Introduce new options to just install the server, client, drone or
combination


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
