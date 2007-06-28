From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 28 Jun 2007 21:26:34 +0300
Subject: [Buildroot] build fails with current uclibc
Message-ID: <20070628212634.51a2fb0d@newbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello, 

Current buildroot fails with configuration:

BR2_arm=y
BR2_arm920t=y
BR2_ARM_TYPE="ARM920T"
BR2_ARM_OABI=y
BR2_KERNEL_HEADERS_2_6_21=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.21.5"
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="snapshot"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
BR2_PTHREADS_OLD=y
BR2_GCC_VERSION="3.4.6"

make[1]: Entering directory `buildroot/toolchain_build_arm/uClibc'
../libc/misc/wchar/wchar.c:170: error: syntax error before "attribute_hidden"
../libc/misc/wchar/wchar.c:170: warning: data definition has no type or storage class
../libc/misc/wchar/wchar.c:173: error: syntax error before "attribute_hidden"
../libc/misc/wchar/wchar.c:173: warning: data definition has no type or storage class
make[2]: *** [../utils/iconv] Error 1
make[1]: *** [utils] ?????? 2

BR,
Ivan
