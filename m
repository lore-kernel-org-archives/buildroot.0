From: Sushi Sensei <sinestado@gmail.com>
Date: Fri, 12 Oct 2007 12:44:54 -0300
Subject: [Buildroot] haserl don't compile - ERROR
Message-ID: <a63ecaf0710120844k52b2772cxfd23eb928c6a9cd5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/tmp/BUILDROOT/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-g -O2 -Wall  -o haserl  haserl.o
haserl.o: In function `myputenv':
/tmp/BUILDROOT/buildroot/build_i686/haserl-0.8.0/src/haserl.c:134: undefined
reference to `index'
collect2: ld returned 1 exit status
make[2]: *** [haserl] Error 1
make[2]: se sale del directorio `/tmp/BUILDROOT/buildroot/build_i686/haserl-
0.8.0/src'
make[1]: *** [all-recursive] Error 1
make[1]: se sale del directorio `/tmp/BUILDROOT/buildroot/build_i686/haserl-
0.8.0'
make: *** [/tmp/BUILDROOT/buildroot/build_i686/haserl-0.8.0/src/haserl]
Error 2


-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071012/ee22b62c/attachment.htm 
