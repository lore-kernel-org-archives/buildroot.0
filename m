From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 13 Sep 2007 20:03:24 -0700 (PDT)
Subject: [Buildroot] libusb fails to build with recent buildroot snapshot
Message-ID: <12667665.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I am trying to build libusb with latest buildroot snapshot for arm926ejs
with uclibc languages=c,c++, I get below mentioned error when building
libusb

<snip>
<snip>
libtool: link: warning: library
`/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.1/../../../../arm-linux-uclibcgnueabi/lib/libstdc++.la'
was moved.
<snip>
<snip>
<snip>
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.1/../../../../arm-linux-uclibcgnueabi/bin/ld:
warning: libusb-0.1.so.4, needed by ../.libs/libusbpp.so, not found (try
using -rpath or -rpath-link)
../.libs/libusbpp.so: undefined reference to `usb_find_busses'
../.libs/libusbpp.so: undefined reference to `usb_init'
../.libs/libusbpp.so: undefined reference to `usb_find_devices'
../.libs/libusbpp.so: undefined reference to `usb_open'
../.libs/libusbpp.so: undefined reference to `usb_get_busses'
../.libs/libusbpp.so: undefined reference to `usb_control_msg'
../.libs/libusbpp.so: undefined reference to `usb_get_driver_np'
../.libs/libusbpp.so: undefined reference to `usb_get_string'
../.libs/libusbpp.so: undefined reference to `usb_close'
collect2: ld returned 1 exit status
make[3]: *** [descriptor_test] Error 1
make[3]: Leaving directory
`/home/guru/project/original/bldrt/buildroot/build_arm/libusb-0.1.12/tests'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/guru/project/original/bldrt/buildroot/build_arm/libusb-0.1.12'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/guru/project/original/bldrt/buildroot/build_arm/libusb-0.1.12'
make: ***
[/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/lib/libusb.so]
Error 2


Kindly let me know how to solve this

Regards
Gururaja

My Buildroot config is attahced

http://www.nabble.com/file/p12667665/buildroot_snapshot.config
buildroot_snapshot.config 
-- 
View this message in context: http://www.nabble.com/libusb-fails-to-build-with-recent-buildroot-snapshot-tf4439859.html#a12667665
Sent from the BuildRoot mailing list archive at Nabble.com.
