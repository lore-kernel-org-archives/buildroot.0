From: Albert Causing <albertcausing@gmail.com>
Date: Tue, 5 Feb 2008 10:56:20 +0800
Subject: [Buildroot] guyz, im stucked with this!
Message-ID: <afc3bae70802041856x2eb1b2b7m4f60afe4984d2dc8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Where im supposed to get the graphics.c needed by grub?



tparm.c: In function 'grub_tparm':
tparm.c:719: warning: dereferencing type-punned pointer will break
strict-aliasing rules
make[3]: *** No rule to make target `graphics.c', needed by
`pre_stage2_exec-graphics.o'.  Stop.
make[3]: Leaving directory
`/opt/buildroot/buildroot/build_i686/grub-0.97/stage2'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/opt/buildroot/buildroot/build_i686/grub-0.97'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/opt/buildroot/buildroot/build_i686/grub-0.97'
make: *** [/opt/buildroot/buildroot/build_i686/grub-0.97/grub/grub] Error 2
