From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Mar 2009 13:07:41 +0000 (UTC)
Subject: [Buildroot] [Bug 151] New: openssl package trivial fixes
Message-ID: <bug-151-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=151

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: openssl package trivial fixes
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=109)
 --> (https://bugs.busybox.net/attachment.cgi?id=109)
openssl package misc fixes

* Avoid fips directory completely since it just installs source file cruft in
lib
* Point openssldir to a more friendly and common /etc/ssl rather than
/usr/lib/ssl


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
