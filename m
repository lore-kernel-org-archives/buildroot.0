From: Rex Luscus <sinestado@gmail.com>
Date: Wed, 19 Sep 2007 19:08:14 -0300
Subject: [Buildroot] liblockfile breaks in compilation
Message-ID: <46F19DCE.50707@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

make[1]: se ingresa al directorio 
`/tmp/BUILDROOT/buildroot/build_i586/dialog-1.1-20070704'
make[1]: No se hace nada para `all'.
make[1]: se sale del directorio 
`/tmp/BUILDROOT/buildroot/build_i586/dialog-1.1-20070704'
mkdir -p 
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/share/man/man1 
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/share/man/man3
mkdir -p /tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/share/man/man3
rm -f /tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/lib/liblockfile.so
/usr/bin/make -j1 -C 
/tmp/BUILDROOT/buildroot/build_i586/liblockfile-1.06.1 
ROOT=/tmp/BUILDROOT/buildroot/build_i586/staging_dir install
make[1]: se ingresa al directorio 
`/tmp/BUILDROOT/buildroot/build_i586/liblockfile-1.06.1'
install -m 644 lockfile.h maillock.h 
/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/local/include
install: target 
?/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/local/include? is 
not a directory
make[1]: *** [install_common] Error 1
make[1]: se sale del directorio 
`/tmp/BUILDROOT/buildroot/build_i586/liblockfile-1.06.1'
make: *** 
[/tmp/BUILDROOT/buildroot/build_i586/staging_dir/lib/liblockfile.so.1.0] 
Error 2
[root at emiliano 
buildroot]#                                                                               
