From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Feb 2010 06:16:10 +0000 (UTC)
Subject: [Buildroot] [Bug 1039] New: Not compiled on ubuntu karmic
Message-ID: <bug-1039-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1039

              Host: x86
            Target: arm
           Summary: Not compiled on ubuntu karmic
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: edbond at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1045)
 --> (https://bugs.busybox.net/attachment.cgi?id=1045)
config

Making all in bin
make[3]: Entering directory
`/home/eduard/buildroot-2009.11/output/build/autoconf-2.64/bin'
autom4te_perllibdir='..'/lib AUTOM4TE_CFG='../lib/autom4te.cfg'        
../bin/autom4te -B '..'/lib -B '..'/lib         --language M4sh --cache ''
--melt ./autoconf.as -o autoconf.in
autom4te: need GNU m4 1.4 or later:
/home/eduard/buildroot-2009.11/output/host/usr/bin/m4
make[3]: *** [autoconf.in] Error 1
make[3]: Leaving directory
`/home/eduard/buildroot-2009.11/output/build/autoconf-2.64/bin'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/eduard/buildroot-2009.11/output/build/autoconf-2.64'

m4 (GNU M4) 1.4.13


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
