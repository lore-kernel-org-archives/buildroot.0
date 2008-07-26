From: Jonathan and Caroline Moore <jandcmoore@gmail.com>
Date: Sat, 26 Jul 2008 08:46:57 +0100
Subject: [Buildroot] Bash failing
Message-ID: <8bf7d05b0807260046q35afd439kf3d0a8b950dc5344@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anyone able to help me out with these bash complaints please.

Jonathan (buildroot 20080725)

In file included from display.c:49:
tcap.h:35:23: error: termcap.h: No such file or directory
display.c: In function 'rl_character_len':
display.c:1961: warning: comparison is always true due to limited
range of data type
display.c: In function 'insert_some_chars':
display.c:2225: warning: assignment makes pointer from integer without a cast
display.c: In function 'delete_chars':
display.c:2268: warning: assignment makes pointer from integer without a cast
make[2]: *** [display.o] Error 1
make[2]: Leaving directory
`/home/jm/git/Arm.2410/buildroot-20080725/build_arm/bash-3.2/lib/readline'
make[1]: *** [lib/readline/libreadline.a] Error 1
make[1]: Leaving directory
`/home/jm/git/Arm.2410/buildroot-20080725/build_arm/bash-3.2'
make: *** [/home/jm/git/Arm.2410/buildroot-20080725/build_arm/bash-3.2/bash]
Error 2

-- 
Jonathan (and Caroline)

Jonathan and Caroline Moore
JandCMoore at gmail.com (Jonathan)
CandJMoore at gmail.com (Caroline)
http://jandcmoore.googlepages.com/
