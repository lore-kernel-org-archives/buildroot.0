From: Brian Beattie <beattie@beattie-home.net>
Date: Thu, 31 Jul 2008 15:36:26 -0700 (PDT)
Subject: [Buildroot] my /etc/init.d/rcS won't run
Message-ID: <oVJvhsJM.1217543786.9718410.beattie@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm building a generic powerpc buildroot and it's all working as far as
I can tell, except the /etc/init.d/rcS will not run.  The line
"null::sysinit:/etc/init.d/rcS" is in /etc/inittab (I'm using
target/generic/target_skeleton/...).  Everything else in inittab seems
to be working and when I take the entries that mount /proc and all out
/proc does not get mounted.  When I run /etc/rcS it works fine.  The
permissions look OK.  I even put "echo $0>>/tag" as the first
executable line in the file, but rcS just does not want to run.

I'm baffeled, has anybody else run into this?
