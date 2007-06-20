From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Wed, 20 Jun 2007 16:38:16 +0700
Subject: [Buildroot] buildroot-20070620.tar.bz2 snapshot issue
Message-ID: <5d75f4610706200238ud163a2jbe00525e00b274a9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Using buildroot-20070620.tar.bz2 snapshot on a linux system, when I
try to compile
the gettext I get an error.  I used the default gcc and uclibc
settings.  How can I solve
this problem?

make[4]: Entering directory
`/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/gettext-0.14.6/gettext-tools/src'
/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
-DLOCALEDIR=\"/usr/share/locale\"
-DLOCALE_ALIAS_PATH=\"/usr/share/locale\" -DUSEJEXE=0
-DGETTEXTJEXEDIR=\"/lib/gettext\"
-DGETTEXTJAR=\"/usr/share/gettext/gettext.jar\" -DLIBDIR=\"/lib\"
-DGETTEXTDATADIR=\"/usr/share/gettext\"
-DPROJECTSDIR=\"/usr/share/gettext/projects\" -DHAVE_CONFIG_H -I. -I.
-I..  -I. -I. -I.. -I../libgrep -I../libuniname -I../lib -I../lib
-I../intl -I../../gettext-runtime/intl  -DINSTALLDIR=\"/bin\" -Os
-pipe  -c -o msgfmt-plural-eval.o `test -f 'plural-eval.c' || echo
'./'`plural-eval.c
In file included from plural-eval.c:33:
../../gettext-runtime/intl/eval-plural.h:28: error: conflicting types
for 'plural_eval'
../../gettext-runtime/intl/plural-exp.h:115: error: previous
declaration of 'plural_eval' was here
make[4]: *** [msgfmt-plural-eval.o] Error 1
make[4]: Leaving directory
'/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/gettext-0.14.6/gettext-tools/src'
