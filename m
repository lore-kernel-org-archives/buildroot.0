From: AM <madwifi@vermark.com>
Date: Sun, 24 Jun 2007 14:15:10 -0400
Subject: [Buildroot] gettext-0.16.1 compile error
References: <f0528b5b0706241049wd348da3v4c822d5b301d0738@mail.gmail.com>
Message-ID: <006201c7b68b$9a097950$0c02a8c0@vgsdt100>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone come across this before? I appreciate your help/input

Thanks

AM


I.. -I.. -I../libgrep -I../libuniname -I../gnulib-lib -I../gnulib-lib -I../intl 
 -I../../gettext-runtime/intl -Os -pipe -I/home/amark/development/1.1/buildroot/build_i586/staging_dir/usr/include 
 --sysroot=/home/amark/development/1.1/buildroot/build_i586/staging_dir/ -isysroot 
/home/amark/development/1.1/buildroot/build_i586/staging_dir -c 
plural-eval.c  -fPIC -DPIC -o .libs/plural-eval.o
In file included from plural-eval.c:37:
../../gettext-runtime/intl/eval-plural.h:28: error: conflicting types for 
'plural_eval'
../../gettext-runtime/intl/plural-exp.h:115: error: previous declaration of 
'plural_eval' was here
make[5]: *** [plural-eval.lo] Error 1
make[5]: Leaving directory 
`/home/amark/development/1.1/buildroot/build_i586/gettext-0.16.1/gettext-tools/src'
make[4]: *** [all] Error 2
make[4]: Leaving directory 
`/home/amark/development/1.1/buildroot/build_i586/gettext-0.16.1/gettext-tools/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory 
`/home/amark/development/1.1/buildroot/build_i586/gettext-0.16.1/gettext-tools'
make[2]: *** [all] Error 2
make[2]: Leaving directory 
`/home/amark/development/1.1/buildroot/build_i586/gettext-0.16.1/gettext-tools'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory 
`/home/amark/development/1.1/buildroot/build_i586/gettext-0.16.1'
make: *** 
[/home/amark/development/1.1/buildroot/build_i586/gettext-0.16.1/gettext-runtime/src/gettext] 
Error 2
