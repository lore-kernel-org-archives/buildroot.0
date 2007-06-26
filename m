From: Nam Hoang <rosemanit@gmail.com>
Date: Tue, 26 Jun 2007 15:32:45 +0700
Subject: [Buildroot] [buildroot] HELP : bash-3.2 - build problem
Message-ID: <b872c6870706260132w2ebda71bwe69eaca9d7babd9f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling bash package, i met the following error message:
/usr/bin/gcc -L/home/namhh/mini-linux/buildroot/build_i686/staging_dir/lib
-L/home/namhh/mini-linux/buildroot/build_i686/staging_dir/usr/lib -rdynamic
-Os -pipe
-I/home/namhh/mini-linux/buildroot/build_i686/staging_dir/usr/include
--sysroot=/home/namhh/mini-linux/buildroot/build_i686/staging_dir/ -isysroot
/home/namhh/mini-linux/buildroot/build_i686/staging_dir -o mkbuiltins
mkbuiltins.o
/usr/bin/ld: this linker was not configured to use sysroots
collect2: ld returned 1 exit status
make[2]: *** [mkbuiltins] Error 1
make[2]: Leaving directory
`/home/namhh/mini-linux/buildroot/build_i686/bash-3.2/builtins'
make[1]: *** [builtins/builtext.h] Error 1
make[1]: Leaving directory
`/home/namhh/mini-linux/buildroot/build_i686/bash-3.2'
make: *** [/home/namhh/mini-linux/buildroot/build_i686/bash-3.2/bash] Error
2

Past few days, i still built bash successfully, but now, i can't. What wrong
i did ?

Thanks,
HONGNAM
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070626/2d0ce926/attachment.htm 
