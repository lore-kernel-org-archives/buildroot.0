From: rafael2k <rafael@riseup.net>
Date: Mon, 1 Oct 2007 15:37:00 -0300
Subject: [Buildroot] x11r7 build error
Message-ID: <200710011537.03174.rafael@riseup.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm triyng to compile x11r7 in a i386 host to a i386 target.

the following error appears to me:

(cd /home/rafael2k/programs/gnuden/buildroot/build_i386/libxcb-1.0/src; /bin/sh ../libtool  --tag=CC --mode=relink /home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -Os -pipe -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/include -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/include --sysroot=/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/ -isysroot /home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir -mtune=i386 -march=i386 -Wall -pedantic -Wpointer-arith -Wstrict-prototypes -Wmissing-declarations -Wnested-externs -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/include -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/include -g -O2 -version-info 
0:0:0 -o libxcb-xvmc.la -rpath /usr/lib xvmc.lo 
libxcb.la -inst-prefix-dir /home/rafael2k/programs/gnuden/buildroot/project_build_i386/gnudenberg/root)
/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -Os -pipe  -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/include -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/include --sysroot=/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/ -isysroot /home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir -mtune=i386 -march=i386 -shared  .libs/xvmc.o  -L/home/rafael2k/programs/gnuden/buildroot/project_build_i386/gnudenberg/root/usr/lib -L/usr/lib -lxcb -L/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/lib  -mtune=i386 -march=i386 -Wl,-soname -Wl,libxcb-xvmc.so.0 -o .libs/libxcb-xvmc.so.0.0.0
/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/bin/../lib/gcc/i386-linux-uclibc/4.2.1/../../../../i386-linux-uclibc/bin/ld: 
cannot find /lib/libc.so.0
collect2: ld returned 1 exit status
libtool: install: error: relink `libxcb-xvmc.la' with the above command before 
installing it
make[2]: *** [install-libLTLIBRARIES] Error 1
make[2]: Leaving directory 
`/home/rafael2k/programs/gnuden/buildroot/build_i386/libxcb-1.0/src'
make[1]: *** [install-exec-recursive] Error 1
make[1]: Leaving directory 
`/home/rafael2k/programs/gnuden/buildroot/build_i386/libxcb-1.0'
make: *** 
[/home/rafael2k/programs/gnuden/buildroot/build_i386/libxcb-1.0/.stamp_target_installed] 
Error 2


anyone has some light to me?

thx!
rafael diniz

-- 
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
Ci?ncia da Computa??o @  Unicamp
R?dio Muda, radiolivre.org, TV Piolho, tvlivre.org, www.midiaindependente.org
Chave PGP: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x2FF86098
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part.
Url : http://busybox.net/lists/buildroot/attachments/20071001/cad4fd99/attachment.pgp 
