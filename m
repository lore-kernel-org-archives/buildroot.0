From: kimtuan <kimtuan@mbdsys.com>
Date: Wed, 28 Mar 2007 18:36:25 +0200
Subject: [Buildroot]  Error with Busybox
Message-ID: <460A9989.6030108@mbdsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to build with Busybox but  I can't find out why I got this 
building error :

/home/kimtuan/work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-strip: 
'busybox_unstripped': No such file
install: cannot stat `busybox': No such file or directory
make[1]: *** [install] Error 1
make[1]: Leaving directory 
`/home/kimtuan/work/buildroot/build_arm/busybox-1.5.0'
make: *** [/home/kimtuan/work/buildroot/build_arm/root/bin/busybox] Error 2

Kim Tuan
