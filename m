From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Nov 2009 17:27:05 +0000 (UTC)
Subject: [Buildroot] [Bug 709] New: Bump lighttpd package to 1.4.24
Message-ID: <bug-709-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=709

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump lighttpd package to 1.4.24
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://www.lighttpd.net/2009/10/25/1-4-24-now-with-tls-
                    sni-and-money-back-guarantee
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=737)
 --> (https://bugs.busybox.net/attachment.cgi?id=737)
Bump lighttpd package to 1.4.24

Many bugfixes, most notable enhancement being added support for TLS SNI.
mod_rewrite patch picked up from upstream @
http://redmine.lighttpd.net/projects/lighttpd/repository/revisions/2683 and
scheduled for 1.4.25.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
