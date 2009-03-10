From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Mar 2009 07:47:05 +0000 (UTC)
Subject: [Buildroot] [Bug 165] New: openmotif does not build
Message-ID: <bug-165-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=165

              Host: Ubuntu 8.10 (64bit)
            Target: i586
             Build: buildroot-2009.02
           Summary: openmotif does not build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mathis_w at gmx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=117)
 --> (https://bugs.busybox.net/attachment.cgi?id=117)
buildroot configuration

When compiling buildroot with openmotif enabled, it always fails with:

make[3]: Betrete Verzeichnis
'/home/mathis/buildroot-2009.02/build_i586/openmotif-2.3.0-host/config/util'
gcc -DHAVE_CONFIG_H -I. -I../../include -I../../lib/Xm     -g -O2 -Wall -g
-fno-strict-aliasing -Wno-unused -Wno-comment -fno-tree-ter -MT makestrs.o -MD
-MP -MF .deps/makestrs.Tpo -c -o makestrs.o makestrs.c
mv -f .deps/makestrs.Tpo .deps/makestrs.Po
/bin/bash ../../libtool --tag=CC   --mode=link gcc  -g -O2 -Wall -g
-fno-strict-aliasing -Wno-unused -Wno-comment -fno-tree-ter   -o makestrs
makestrs.o  
../../libtool: line 810: X--tag=CC: command not found
../../libtool: line 843: libtool: ignoring unknown tag : command not found
../../libtool: line 810: X--mode=link: command not found
../../libtool: line 976: *** Warning: inferring the mode of operation is
deprecated.: command not found
../../libtool: line 977: *** Future versions of Libtool will require
--mode=MODE be specified.: command not found
../../libtool: line 2213: X-g: command not found
../../libtool: line 2213: X-O2: command not found
../../libtool: line 2213: X-Wall: command not found
../../libtool: line 2213: X-g: command not found
../../libtool: line 2213: X-fno-strict-aliasing: command not found
../../libtool: line 2213: X-Wno-unused: command not found
../../libtool: line 2213: X-Wno-comment: command not found
../../libtool: line 2213: X-fno-tree-ter: command not found
../../libtool: line 2382: Xmakestrs: command not found
X: user not authorized to run the X server, aborting.
../../libtool: line 2394: Xmakestrs: command not found
../../libtool: line 2402: mkdir /.libs: No such file or directory
mkdir: cannot create directory `/.libs': Permission denied
make[3]: *** [makestrs] Fehler 1


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
