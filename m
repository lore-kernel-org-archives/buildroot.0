From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 4 Nov 2008 13:16:46 -0800
Subject: [Buildroot] [buildroot 0005974]: Matchbox desktop try to sed
	/usr/lib/libxcb.la
Message-ID: <ed95fb0a5a6b71dd68db3c6c942d09d7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5974 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5974
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-04-2008 13:16 PST
Last Modified:              11-04-2008 13:16 PST
====================================================================== 
Summary:                    Matchbox desktop try to sed /usr/lib/libxcb.la
Description: 
Making all in modules
make[3]: Entering directory
`/home/roberto/gles/buildroot/build_i586/matchbox-desktop-0.9.1/modules'
if /bin/bash ../libtool --mode=compile
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I.. -I../src
-DDATADIR=\"/usr/share/matchbox\"
-DPKGDATADIR=\"/usr/share/matchbox/matchbox\"
-DPREFIX=\"/home/roberto/gles/buildroot/build_i586/staging_dir/usr\"
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/libpng12 
 -I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/startup-notification-1.0
     -g -O2 -MT tasks.lo -MD -MP -MF ".deps/tasks.Tpo" -c -o tasks.lo
tasks.c; \
	then mv -f ".deps/tasks.Tpo" ".deps/tasks.Plo"; else rm -f
".deps/tasks.Tpo"; exit 1; fi
mkdir .libs

/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I.. -I../src
-DDATADIR=\"/usr/share/matchbox\"
-DPKGDATADIR=\"/usr/share/matchbox/matchbox\"
-DPREFIX=\"/home/roberto/gles/buildroot/build_i586/staging_dir/usr\"
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/libpng12
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/startup-notification-1.0
-g -O2 -MT tasks.lo -MD -MP -MF .deps/tasks.Tpo -c tasks.c  -fPIC -DPIC -o
.libs/tasks.o
/bin/bash ../libtool --mode=link
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -g -O2   -o tasks.la -rpath
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/matchbox/desktop
-avoid-version -module -export-dynamic tasks.lo
-L/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
-lmb -ljpeg -lX11 -lXext -lpng12   
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -shared  .libs/tasks.o  -Wl,--rpath
-Wl,/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
-Wl,--rpath
-Wl,/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libmb.so
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libjpeg.so
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libX11.so
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libXext.so
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libpng12.so 
-mtune=i586 -march=i586 -Wl,-soname -Wl,tasks.so -o .libs/tasks.so
creating tasks.la
(cd .libs && rm -f tasks.la && ln -s ../tasks.la tasks.la)
if /bin/bash ../libtool --mode=compile
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I.. -I../src
-DDATADIR=\"/usr/share/matchbox\"
-DPKGDATADIR=\"/usr/share/matchbox/matchbox\"
-DPREFIX=\"/home/roberto/gles/buildroot/build_i586/staging_dir/usr\"
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/libpng12 
 -I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/startup-notification-1.0
     -g -O2 -MT dotdesktop.lo -MD -MP -MF ".deps/dotdesktop.Tpo" -c -o
dotdesktop.lo dotdesktop.c; \
	then mv -f ".deps/dotdesktop.Tpo" ".deps/dotdesktop.Plo"; else rm -f
".deps/dotdesktop.Tpo"; exit 1; fi

/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I.. -I../src
-DDATADIR=\"/usr/share/matchbox\"
-DPKGDATADIR=\"/usr/share/matchbox/matchbox\"
-DPREFIX=\"/home/roberto/gles/buildroot/build_i586/staging_dir/usr\"
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/libpng12
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/startup-notification-1.0
-g -O2 -MT dotdesktop.lo -MD -MP -MF .deps/dotdesktop.Tpo -c dotdesktop.c 
-fPIC -DPIC -o .libs/dotdesktop.o
In file included from dotdesktop.c:9:
../config.h:40:1: warning: "HAVE_STDLIB_H" redefined
In file included from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/jpeglib.h:24,
                 from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/libmb/mbpixbuf.h:48,
                 from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/libmb/mb.h:26,
                 from ../src/mbdesktop.h:35,
                 from ../src/mbdesktop_module.h:4,
                 from dotdesktop.c:1:
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/jconfig.h:12:1:
warning: this is the location of the previous definition
/bin/bash ../libtool --mode=link
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -g -O2   -o dotdesktop.la -rpath
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/matchbox/desktop
-avoid-version -module -export-dynamic dotdesktop.lo
-L/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
-lmb -ljpeg -lX11 -lXext -lpng12  
-L/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
-lstartup-notification-1   
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -shared  .libs/dotdesktop.o  -Wl,--rpath
-Wl,/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
-Wl,--rpath
-Wl,/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libmb.so
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libjpeg.so
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libX11.so
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libXext.so
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libpng12.so
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/libstartup-notification-1.so
 -mtune=i586 -march=i586 -Wl,-soname -Wl,dotdesktop.so -o
.libs/dotdesktop.so
creating dotdesktop.la
/home/roberto/gles/buildroot/toolchain_build_i586/bin/sed: can't read
/usr/lib/libxcb.la: No such file or directory
libtool: link: `/usr/lib/libxcb.la' is not a valid libtool archive
make[3]: *** [dotdesktop.la] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-desktop-0.9.1/modules'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-desktop-0.9.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-desktop-0.9.1'
make: ***
[/home/roberto/gles/buildroot/build_i586/matchbox-desktop-0.9.1/.compiled]
Error 2


roberto at rafbook:~/gles/buildroot$ find . -name libxcb.la
./build_i586/libxcb-1.1/src/libxcb.la
./build_i586/libxcb-1.1/src/.libs/libxcb.la
./build_i586/staging_dir/usr/lib/libxcb.la

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-04-08 13:16  robang74       New Issue                                    
11-04-08 13:16  robang74       Status                   new => assigned     
11-04-08 13:16  robang74       Assigned To               => buildroot       
======================================================================
