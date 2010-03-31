From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Mar 2010 18:36:28 +0000 (UTC)
Subject: [Buildroot] [Bug 1459] New: Misc QA fixes
Message-ID: <bug-1459-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1459

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Misc QA fixes
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1423)
 --> (https://bugs.busybox.net/attachment.cgi?id=1423)
Fix dnsmasq & iw packages

Some miscellaneous quality fixes:

* dnsmasq CFLAGS go in make options rather than environment.

* iw depends on host-pkg-config.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
