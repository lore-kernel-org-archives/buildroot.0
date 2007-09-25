From: Sushi Sensei <sinestado@gmail.com>
Date: Tue, 25 Sep 2007 16:39:45 -0300
Subject: [Buildroot] Error in uClibc-0.9.29 revision 20025
Message-ID: <a63ecaf0709251239p4a44717brfcbae02d3bae4147@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the compilation breaks with this errors:



make[1]: se ingresa al directorio
`/tmp/BUILDROOT/buildroot/toolchain_build_i586/uClibc-0.9.29'
make[2]: `conf' is up to date.
make[3]: `conf' is up to date.
  STRIP -x -R .note -R .comment lib/libc.a
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/__parsegrent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/__parsepwent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/__parsespent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/__pgsreader.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/fgetgrent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/fgetgrent_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/fgetpwent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/fgetpwent_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/fgetspent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/fgetspent_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getgrent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getgrent_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getgrgid.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getgrgid_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getgrnam.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getgrnam_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getpw.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getpwent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getpwent_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getpwnam.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getpwnam_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getpwuid.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getpwuid_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getspent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getspent_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getspnam.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/getspnam_r.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/initgroups.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/lckpwdf.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/putgrent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/putpwent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/putspent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/sgetspent.os': No such file
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip:
'libc/soft-fp/sgetspent_r.os': No such file
make[2]: *** [lib/libc.a] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: se sale del directorio
`/tmp/BUILDROOT/buildroot/toolchain_build_i586/uClibc-0.9.29'
make: *** [/tmp/BUILDROOT/buildroot/toolchain_build_i586/uClibc-0.9.29/lib/libc.a]
Error 2










-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070925/d08eff6c/attachment.htm 
