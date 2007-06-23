From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 23 Jun 2007 15:41:25 +0200
Subject: [Buildroot] buildroot-20070622.tar.bz2 vs. util-linux/fdisk
In-Reply-To: <5d75f4610706230632l20cdcb46me89c0b339be189e9@mail.gmail.com>
References: <5d75f4610706230632l20cdcb46me89c0b339be189e9@mail.gmail.com>
Message-ID: <20070623134125.GK4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 23, 2007 at 08:32:28PM +0700, BuraphaLinux Server wrote:
>Hello,
>
>    With buildroot-20070622.tar.bz2 it fails to build fdisk in
>util-linux with this message:
>
>/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
>-c -Os -pipe  -I/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/usr/include
>--sysroot=/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/
>-isysroot /var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir
>-I../lib -Wall -Wmissing-prototypes -Wstrict-prototypes -DNCH=1
>-D_FILE_OFFSET_BITS=64 -DSBINDIR=\"/sbin\" -DUSRSBINDIR=\"/usr/sbin\"
>-DLOGDIR=\"/var/log\" -DVARPATH=\"/var\"
>-DLOCALEDIR=\"/usr/share/locale\" -Os -pipe
>-I/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/usr/include
>--sysroot=/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/
>-isysroot /var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir
>llseek.c -o llseek.o
>llseek.c:34: error: expected declaration specifiers or '...' before '_llseek'

Since i have no idea what revision these so called snapshots are using,
i will ignore them for now, generally.

I use busybox which deals fine with and without LFS, no idea about
util-linux so try to fix this upstream, i'd suggest.

BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
