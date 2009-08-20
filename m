From: Bai Shuwei <baishuwei@gmail.com>
Date: Thu, 20 Aug 2009 22:24:46 +0800
Subject: [Buildroot] GCC building error: checking for exception model to
	use... configure: error: unable to detect exception model <|>
	i686-linux-uclibc-gcc: language objective-c not recognized
Message-ID: <f3566d60908200724p61f2dfddtec97c8013e20af19@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all:
    When I complile the buildroot, I get the bellow error message. Thanks
for your help!
make[2]: Leaving directory
`/home/baishw/crosscompile/buildroot-2009.05/build_i686/gcc-4.3.3-target/i686-linux-uclibc/libmudflap'
Checking multilib configuration for libobjc...
Configuring in i686-linux-uclibc/libobjc
configure: loading cache ./config.cache
checking build system type... x86_64-pc-linux-gnu
checking for --enable-version-specific-runtime-libs... no
checking host system type... i686-pc-linux-uclibc
checking target system type... i686-pc-linux-uclibc
checking for i686-linux-uclibc-gcc...
/home/baishw/crosscompile/buildroot-2009.05/
.......
 checking for thread model used by GCC... posix
checking for exception model to use... configure: error: unable to detect
exception model
make[1]: *** [configure-target-libobjc] Error 1
make[1]: Leaving directory
`/home/baishw/crosscompile/buildroot-2009.05/build_i686/gcc-4.3.3-target'
make: *** [all] Error 2


The error log file is
build_i686/gcc-4.3.3-target/i686-linux-uclibc/libobjc/config.log

configure:10395: checking for exception model to use
configure:10427:
/home/baishw/crosscompile/buildroot-2009.05/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-c -x objective-c -fgnu-r
untime -fobjc-exceptions -S  conftest.c >&5
i686-linux-uclibc-gcc: language objective-c not recognized
i686-linux-uclibc-gcc: language objective-c not recognized
i686-linux-uclibc-gcc: conftest.c: linker input file unused because linking
not done
configure:10430: $? = 0
configure:10451: error: unable to detect exception model

Best Regards!

Bai Shuwei

-- 
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

Personal URL: http://dslab.lzu.edu.cn:8080/members/baishw/
E-Mail: baishuwei at gmail.com or baishuwei at dslab.lzu.edu.cn
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090820/d0e66f3b/attachment.htm>
