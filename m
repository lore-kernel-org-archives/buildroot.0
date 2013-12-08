From: Javier Alejandro Saenz Leguizamon <jasaenzl@unal.edu.co>
Date: Sun, 8 Dec 2013 18:39:08 -0500
Subject: [Buildroot] wpa_supplicant doesn't compile
Message-ID: <CALADVSNmgocixipUwij+HS-bari8Toi-q_micsA44YwwRr9mUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good day.

I'm having trouble when try to compile the wpa_supplicant package, I always
get this error, can anyone please help me with this. I will attach the
.config I'm using.

jasaenzl at Killer-Laptop:~/develop/test/thesis_dev_repo/buildroot-2013.08.1$
make
/usr/bin/make -j5  HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++"
silentoldconfig
make[1]: Entering directory
`/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1'
BR2_DEFCONFIG=''
KCONFIG_AUTOCONFIG=/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/build/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/build/buildroot-config/autoconf.h
KCONFIG_TRISTATE=/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/build/buildroot-config/tristate.config
BUILDROOT_CONFIG=/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/.config
/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/build/buildroot-config/conf
--silentoldconfig Config.in
make[1]: Leaving directory
`/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1'
>>> wpa_supplicant 2.0 Building
PATH="/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/host/bin:/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/host/usr/bin:/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/host/usr/sbin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/opt/Xilinx/13.4/ISE_DS/ISE/bin/lin/:/home/jasaenzl/develop/test/arm-2008q3/bin:/home/jasaenzl/develop/devproview/os_linux/hw_x86/exp/exe"
PERLLIB="/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/host/usr/lib/perl"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -pipe -Os
 -I/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/host/usr/armeb-buildroot-linux-gnueabi/sysroot/usr/include/libnl3/"
LDFLAGS="" /usr/bin/make -j5
CC="/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/host/usr/bin/arm-none-linux-gnueabi-gcc"
-C
/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/build/wpa_supplicant-2.0/wpa_supplicant
make[1]: Entering directory
`/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/build/wpa_supplicant-2.0/wpa_supplicant'
  LD  wpa_cli
../src/drivers/driver_wext.c: In function 'wpa_driver_wext_set_key_ext':
../src/drivers/driver_wext.c:1703: error: 'IW_ENCODE_ALG_AES_CMAC'
undeclared (first use in this function)
../src/drivers/driver_wext.c:1703: error: (Each undeclared identifier is
reported only once
../src/drivers/driver_wext.c:1703: error: for each function it appears in.)
../src/drivers/driver_wext.c: In function 'wpa_driver_wext_associate':
../src/drivers/driver_wext.c:2130: error: 'IW_AUTH_MFP_DISABLED' undeclared
(first use in this function)
../src/drivers/driver_wext.c:2133: error: 'IW_AUTH_MFP_OPTIONAL' undeclared
(first use in this function)
../src/drivers/driver_wext.c:2136: error: 'IW_AUTH_MFP_REQUIRED' undeclared
(first use in this function)
../src/drivers/driver_wext.c:2139: error: 'IW_AUTH_MFP' undeclared (first
use in this function)
make[1]: *** [../src/drivers/driver_wext.o] Error 1
make[1]: Leaving directory
`/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/build/wpa_supplicant-2.0/wpa_supplicant'
make: ***
[/home/jasaenzl/develop/test/thesis_dev_repo/buildroot-2013.08.1/output/build/wpa_supplicant-2.0/.stamp_built]
Error 2
jasaenzl at Killer-Laptop:~/develop/test/thesis_dev_repo/buildroot-2013.08.1$


Javier Alejandro S?enz Leguizam?n
Ingeniero Electr?nico
Universidad Nacional de Colombia
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131208/95b80df2/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 32188 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131208/95b80df2/attachment-0001.obj>
