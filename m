From: Tim Barr <tbarr@multitech.com>
Date: Tue, 22 Jan 2008 08:32:56 -0600
Subject: [Buildroot] Another make problem
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E609BFD950@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well, I got past the rt9 issue and have a version of buildroot that
fixed the fakeroot issue, but now have another error:

/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
-uclibc-gcc -Os -pipe
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/include
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/include
--sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/
-isysroot /home/falingtrea/buildroot/build_arm_wchar/staging_dir -c -O2
-g -Wall -DHAVE_CONFIG_H -DVERSION=\"3.1.9\" -DETCDIR=\"/etc\"
-DLOADAVG_MX=0.8 -DDAEMON_USERNAME=\"at\" -DDAEMON_GROUPNAME=\"at\"
-DLFILE=\"/var/lib/atjobs/.SEQ\" -Wall atd.c
atd.c:498:2: error: #error "No mail command specified."
make[1]: *** [atd.o] Error 1
make[1]: Leaving directory
`/home/falingtrea/buildroot/build_arm_wchar/at-3.1.10'
make: *** [/home/falingtrea/buildroot/build_arm_wchar/at-3.1.10/at]
Error 2

Any suggestions??

Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com
