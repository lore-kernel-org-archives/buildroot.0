From: Sushi Sensei <sinestado@gmail.com>
Date: Thu, 27 Sep 2007 15:30:39 -0300
Subject: [Buildroot] lockfile-progs-0.1.10 not compile in Revision 20067
Message-ID: <a63ecaf0709271130p4c9548calbbf64e1c8004e813@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

make[1]: se ingresa al directorio
`/tmp/BUILDROOT/buildroot/build_i586/lockfile-progs-0.1.10'
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os -pipe  -I/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/include
-I/tmp/BUILDROOT/buildroot/build_i586/staging_dir/include
--sysroot=/tmp/BUILDROOT/buildroot/build_i586/staging_dir/ -isysroot
/tmp/BUILDROOT/buildroot/build_i586/staging_dir -mtune=i586 -march=i586 -o
lockfile-create -L/tmp/BUILDROOT/buildroot/build_i586/staging_dir/lib
-L/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/lib
lockfile-progs.o-llockfile
lockfile-progs.o: In function `parse_arguments':
/tmp/BUILDROOT/buildroot/build_i586/lockfile-progs-0.1.10/lockfile-progs.c:73:
undefined reference to `rindex'
collect2: ld returned 1 exit status
make[1]: *** [lockfile-create] Error 1
make[1]: se sale del directorio
`/tmp/BUILDROOT/buildroot/build_i586/lockfile-progs-0.1.10'
make: ***
[/tmp/BUILDROOT/buildroot/project_build_i586/uclibc/root/usr/bin/lockfile-create]
Error 2


-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070927/4f354e5f/attachment.htm 
