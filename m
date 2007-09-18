From: Rex Luscus <sinestado@gmail.com>
Date: Tue, 18 Sep 2007 20:20:54 -0300
Subject: [Buildroot] libusb don't compile!!!
Message-ID: <46F05D56.4090207@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

when I try to compile LIBUSB it's break with this error:

/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++ 
-Os -pipe -I/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/include 
-I/tmp/BUILDROOT/buildroot/build_i586/staging_dir/include 
--sysroot=/tmp/BUILDROOT/buildroot/build_i586/staging_dir/ -isysroot 
/tmp/BUILDROOT/buildroot/build_i586/staging_dir -mtune=i586 -march=i586 
-g -O2 -o .libs/descriptor_test descriptor_test.o  ../.libs/libusbpp.so 
-L/tmp/BUILDROOT/buildroot/toolchain_build_i586/gcc-4.2.1-final/i586-linux-uclibc/libstdc++-v3/src 
-L/tmp/BUILDROOT/buildroot/toolchain_build_i586/gcc-4.2.1-final/i586-linux-uclibc/libstdc++-v3/src/.libs 
-L/tmp/BUILDROOT/buildroot/toolchain_build_i586/gcc-4.2.1-final/./gcc 
-L/tmp/BUILDROOT/buildroot/build_i586/staging_dir/lib 
-L/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/lib -Wl,--rpath 
-Wl,//lib -Wl,--rpath 
-Wl,/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/../lib/gcc/i586-linux-uclibc/4.2.1/../../../../i586-linux-uclibc/lib
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/../lib/gcc/i586-linux-uclibc/4.2.1/../../../../i586-linux-uclibc/bin/ld: 
warning: libusb-0.1.so.4, needed by ../.libs/libusbpp.so, not found (try 
using -rpath or -rpath-link)
../.libs/libusbpp.so: undefined reference to `usb_find_busses'
../.libs/libusbpp.so: undefined reference to `usb_find_devices'
../.libs/libusbpp.so: undefined reference to `usb_get_busses'
../.libs/libusbpp.so: undefined reference to `usb_init'
../.libs/libusbpp.so: undefined reference to `usb_control_msg'
../.libs/libusbpp.so: undefined reference to `usb_get_driver_np'
../.libs/libusbpp.so: undefined reference to `usb_get_string'
../.libs/libusbpp.so: undefined reference to `usb_open'
../.libs/libusbpp.so: undefined reference to `usb_close'
collect2: ld returned 1 exit status
make[3]: *** [descriptor_test] Error 1
make[3]: se sale del directorio 
`/tmp/BUILDROOT/buildroot/build_i586/libusb-0.1.12/tests'
make[2]: *** [all-recursive] Error 1
make[2]: se sale del directorio 
`/tmp/BUILDROOT/buildroot/build_i586/libusb-0.1.12'
make[1]: *** [all] Error 2
make[1]: se sale del directorio 
`/tmp/BUILDROOT/buildroot/build_i586/libusb-0.1.12'
make: *** 
[/tmp/BUILDROOT/buildroot/build_i586/staging_dir/lib/libusb.so] Error 2
