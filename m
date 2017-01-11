From: paul <paul.arssov@sbcglobal.net>
Date: Tue, 10 Jan 2017 18:33:22 -0800
Subject: [Buildroot] 'orangepi_one_defconfig' build issue
Message-ID: <58759972.50708@sbcglobal.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I did a build for orange-pi' board based on the recently posted 
'orangepi_one_defconfig' , using buildroot-2016-11. There is this error 
coming -
--------------------
       ...
if ! support/scripts/check-kernel-headers.sh
/media/p/data/ai-robo/bld-lnx/buildroot-2016.11/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot 

4.8; then exit 1; fi
Incorrect selection of kernel headers: expected 4.8.x, got 4.9.x
package/pkg-generic.mk:255: recipe for target
'/media/p/data/ai-robo/bld-lnx/buildroot-2016.11/output/build/linux-headers-4.9/.stamp_staging_installed'
failed
make[1]: ***
[/media/p/data/ai-robo/bld-lnx/buildroot-2016.11/output/build/linux-headers-4.9/.stamp_staging_installed]
Error 1
Makefile:76: recipe for target '_all' failed
make: *** [_all] Error 2
--------------------

I did try editing '.config' file but it still shows the same error.
How do we solve the issue?

Thanks, Paul.
