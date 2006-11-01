From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 1 Nov 2006 14:14:50 +0000 (UTC)
Subject: [Buildroot] 'ld' gives "unrecognised emulation mode" during make;
	gcc-3.4.3
Message-ID: <loom.20061101T111436-827@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am using buildroot-20061031 to build arm926t system,
Toolchain options gcc-3.4.3 (-final), ARM, EABI, binutils-2.16.91.0.7
and have set the GNU target suffix to linux-uclibcgnueabi.
[Host system gcc-3.4.6 20060404]

During building libgcc, I get the message
->>
/home/fred/buildroot/build_arm_nofpu/staging_dir/
 arm-linux-uclibcgnueabi/b in/ld: unrecognised emulation mode: armelf_linux
Supported emulations: armelf_linux_eabi
collect2: ld returned 1 exit status
make[3]: *** [libgcc/./_udivsi3.oS] Error 1
-<<
