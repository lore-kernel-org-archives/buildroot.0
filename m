From: Tim Barr <tbarr@multitech.com>
Date: Tue, 19 Feb 2008 09:20:11 -0600
Subject: [Buildroot] SUDO download error
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60A342204@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So even if I get an error like this:

make[1]: Entering directory
`/home/falingtrea/buildroot/build_arm_wchar/at-3.1.10'

/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
-uclibc-gcc -Os -pipe
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/include
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/include
--sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/
-isysroot /home/falingtrea/buildroot/build_arm_wchar/staging_dir -c -O2
-g -Wall -DHAVE_CONFIG_H -DVERSION=\"3.1.9\" -DETCDIR=\"/etc\"
-DLOADAVG_MX=0.8 -DDAEMON_USERNAME=\"root\" -DDAEMON_GROUPNAME=\"root\"
-DLFILE=\"/var/lib/atjobs/.SEQ\" -Wall atd.c

atd.c:498:2: error: #error "No mail command specified."

make[1]: *** [atd.o] Error 1

And I have a rootfs file, the build is successful?

Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com



-----Original Message-----
From: Ulf Samuelsson [mailto:ulf.samuelsson at atmel.com] 
Sent: Tuesday, February 19, 2008 12:33 AM
To: Tim Barr; buildroot at uclibc.org
Subject: Re: [Buildroot] SUDO download error


 
> Does buildroot tell you whether it finishes? Or do I just assume that 
> if I see no errors that buildroot was successful?

You succeeded, If you get a root file system in your binaries directory.



Best Regards
Ulf Samuelsson 
