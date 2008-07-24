From: Richard <mr.resistor@gmail.com>
Date: Thu, 24 Jul 2008 18:51:07 +0100
Subject: [Buildroot] problem compiling lighttpd (pcre problem)
Message-ID: <ea6597e70807241051y2aeb1c8bt65a841c29c1d5b08@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hey

i have finally got everything i want to compile, except for lighttpd.
the error message given is :

 skipping incompatible /usr/lib/libpcre.so when searching for -lpcre
/dns323/uclibc/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/bin/ld:
cannot find -lpcre

this occurs whether i select lighttpd with pcre support or not. pcre
itself compiles fine, but i cannot see where it has put libpcre.so, it
does not appear to be in the staging dir or target dir.

any ideas?
