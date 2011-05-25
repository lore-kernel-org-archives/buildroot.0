From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 May 2011 04:53:47 +0000 (UTC)
Subject: [Buildroot] [Bug 3781] New: crosstool-ng-1.11.3 fails to build
Message-ID: <bug-3781-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3781

           Summary: crosstool-ng-1.11.3 fails to build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: keguang.zhang at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


While building crosstool-ng-1.11.3 with uClibc-0.9.31, 
The error comes out as below:

...
[ALL  ]    make[4]: Leaving directory
`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.11.3/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc'
[ALL  ]    ln: creating symbolic link
`/opt/buildroot_real6410/output_fs2410/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cc':
File exists
[ERROR]    
[ERROR]    >>  Build failed in step 'Installing final compiler'
[ERROR]    >>
[ERROR]    >>  Error happened in: CT_DoExecLog[scripts/functions]
[ERROR]    >>        called from: do_cc[scripts/build/cc/gcc.sh at 576]
[ERROR]    >>        called from: main[scripts/crosstool-NG.sh at 582]
[ERROR]    >>
[ERROR]    >>  For more info on this error, look at the file: 'build.log'
[ERROR]    >>  There is a list of known issues, some with workarounds, in:
[ERROR]    >>      'docs/B - Known issues.txt'
[ERROR]    
[ERROR]    Build failed in step 'Installing final compiler'
[ERROR]    
[ERROR]    (elapsed: 16:32.56)
make[3]: *** [build] Error 1
make[2]: *** [build.2] Error 2
make[1]: ***
[/opt/buildroot_real6410/output_fs2410/stamps/ct-ng-toolchain-built] Error 2
make: *** [all] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
