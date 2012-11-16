From: Martin Peevski <martin@ronetix.at>
Date: Fri, 16 Nov 2012 16:41:24 +0200
Subject: [Buildroot] Buildroot fail to build when configure for dev
 managment: dynamically with udev
Message-ID: <50A65094.7080202@ronetix.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

     Hi,

     I tryed to build Buildroot with only rootfs, I have already built 
Kernel image. Use external toolchain for the building. I configure 
Buildroot for dynamically /dev managment with udev but during udev 
building I got the following errors:

src/udev-builtin-input_id.c: In function 'test_key':
src/udev-builtin-input_id.c:165: error: 'BTN_TRIGGER_HAPPY' undeclared 
(first use in this function)
src/udev-builtin-input_id.c:165: error: (Each undeclared identifier is 
reported only once
src/udev-builtin-input_id.c:165: error: for each function it appears in.)
make[4]: *** [src/udevadm-udev-builtin-input_id.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [all-recursive] Error 1
make[2]: *** [all] Error 2
make[1]: *** 
[/home/martin/Desktop/sam9x5-linux-sources/rootfs/build/udev-182/.stamp_built] 
Error 2
make: *** [all] Error 2

      Can you, please, give me some advices?
