From: abhiram at ee.iitb.ac.in <abhiram@ee.iitb.ac.in>
Date: Fri, 6 Jul 2007 14:09:33 +0530 (IST)
Subject: [Buildroot] missing library files
Message-ID: <44043.10.107.1.1.1183711173.squirrel@10.107.1.1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Im tryin to build a uclibc+sdl+gtk1.2+tinyx based system using buildroot.

however the compile process stops during the compilation of glib, when it
tries to copy the files libglib.so, libglib-1.2.so, libglib-1.2.so.0,
libglib-1.2.so.0.10, libglib-1.2.so.0.0.10 and libgmodule.so from
staging_dir/lib to root/lib with a 'cannot stat error'. who or what
creates these files and why are they missing in this case?

i tried to get around this by using the cross compile toolchain to compile
glib and then transfer the *.so files to staging_dir/lib. then i get the
error
"No rule to make target `tinyx', needed by `libgtk12'" and the compilation
stops. how do i fix these errors?
