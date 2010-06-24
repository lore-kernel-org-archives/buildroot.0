From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jun 2010 09:14:37 +0000 (UTC)
Subject: [Buildroot] [Bug 2095] New: make gconfig: undefined reference to
 symbol 'dlsym@@GLIBC_2.2.5'
Message-ID: <bug-2095-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2095

           Summary: make gconfig: undefined reference to symbol
                    'dlsym@@GLIBC_2.2.5'
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: slavazanko at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Version: master branch. Why absent in list of 'Version:' field?

My OS is Fedora-13. When I tried to call make with 'gconfig' target I got
error:

/usr/bin/ld:
/dot-dot-dot/buildroot/output/build/buildroot-config/kconfig_load.o: undefined
reference to symbol 'dlsym@@GLIBC_2.2.5' 

Attached path avoid this inconsistence. :)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
