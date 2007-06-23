From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Sat, 23 Jun 2007 20:17:42 +0700
Subject: [Buildroot] buildroot-20070622.tar.bz2 vs. sfdisk
Message-ID: <5d75f4610706230617g4da247d6jf93beebcb9710edd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

   With buildroot-20070622.tar.bz2 when I try to build sfdisk I get this:

/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-fomit-frame-pointer -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Wall -Wmissing-prototypes -Wstrict-prototypes
-Os -pipe  -I/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/usr/include
--sysroot=/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/
-isysroot /var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir
-fomit-frame-pointer -D_GNU_SOURCE -c sfdisk.c -o sfdisk.o
sfdisk.c:141: error: expected declaration specifiers or '...' before '_llseek'
sfdisk.c:141: error: expected declaration specifiers or '...' before 'fd'
sfdisk.c:141: error: expected declaration specifiers or '...' before 'hi'
sfdisk.c:141: error: expected declaration specifiers or '...' before 'lo'
sfdisk.c:142: error: expected declaration specifiers or '...' before 'res'
sfdisk.c:142: error: expected declaration specifiers or '...' before 'wh'
sfdisk.c:142: warning: type defaults to 'int' in declaration of '_syscall5'
sfdisk.c: In function 'sseek':
sfdisk.c:152: warning: implicit declaration of function '_llseek'
sfdisk.c: In function 'msdos_signature':
sfdisk.c:228: warning: pointer targets in initialization differ in signedness
sfdisk.c: In function 'restore_sectors':
sfdisk.c:354: warning: pointer targets in passing argument 1 of
'chars_to_ulong' differ in signedness
sfdisk.c: In function 'copy_to_part':
sfdisk.c:662: warning: pointer targets in passing argument 1 of
'copy_to_int' differ in signedness
sfdisk.c:663: warning: pointer targets in passing argument 1 of
'copy_to_int' differ in signedness
sfdisk.c: In function 'read_stdin':
sfdisk.c:1673: warning: pointer targets in passing argument 1 of
'fgets' differ in signedness
sfdisk.c:1673: warning: pointer targets in assignment differ in signedness
sfdisk.c:1678: warning: pointer targets in passing argument 1 of
'strchr' differ in signedness
sfdisk.c:1678: warning: pointer targets in assignment differ in signedness
sfdisk.c:1683: warning: pointer targets in passing argument 1 of
'strchr' differ in signedness
sfdisk.c:1683: warning: pointer targets in assignment differ in signedness
sfdisk.c:1687: warning: pointer targets in passing argument 1 of
'strcmp' differ in signedness
sfdisk.c:1693: warning: pointer targets in passing argument 1 of
'strchr' differ in signedness
sfdisk.c:1693: warning: pointer targets in assignment differ in signedness
sfdisk.c:1703: warning: pointer targets in passing argument 1 of
'strncmp' differ in signedness
sfdisk.c: In function 'read_line':
sfdisk.c:1983: warning: pointer targets in passing argument 1 of
'strcmp' differ in signedness
sfdisk.c:2021: warning: pointer targets in passing argument 1 of
'strcmp' differ in signedness
sfdisk.c:2023: warning: pointer targets in passing argument 1 of
'strcmp' differ in signedness
sfdisk.c:2025: warning: pointer targets in passing argument 1 of
'strcmp' differ in signedness
sfdisk.c:2027: warning: pointer targets in passing argument 1 of
'strcmp' differ in signedness
sfdisk.c:2029: warning: pointer targets in passing argument 1 of
'get_ul' differ in signedness
sfdisk.c:2045: warning: pointer targets in passing argument 1 of
'get_ul' differ in signedness
sfdisk.c:2058: warning: pointer targets in passing argument 1 of
'get_ul' differ in signedness
sfdisk.c:2092: warning: pointer targets in passing argument 1 of
'strcmp' differ in signedness
sfdisk.c:2094: warning: pointer targets in passing argument 1 of
'strcmp' differ in signedness
sfdisk.c:2094: warning: pointer targets in passing argument 1 of
'strcmp' differ in signedness
sfdisk.c:2116: warning: pointer targets in passing argument 1 of
'get_ul' differ in signedness
sfdisk.c:2117: warning: pointer targets in passing argument 1 of
'get_ul' differ in signedness
sfdisk.c:2118: warning: pointer targets in passing argument 1 of
'get_ul' differ in signedness
sfdisk.c:2129: warning: pointer targets in passing argument 1 of
'get_ul' differ in signedness
sfdisk.c:2130: warning: pointer targets in passing argument 1 of
'get_ul' differ in signedness
sfdisk.c:2131: warning: pointer targets in passing argument 1 of
'get_ul' differ in signedness
make[1]: *** [sfdisk.o] Error 1
make[1]: Leaving directory
`/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/sfdisk'
make: *** [/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/sfdisk/sfdisk]
Error 2
