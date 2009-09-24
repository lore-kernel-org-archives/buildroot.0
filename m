From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Thu, 24 Sep 2009 16:33:13 +0000 (GMT)
Subject: [Buildroot] Foreigh toolchain
In-Reply-To: <87tyysgx87.fsf@macbook.be.48ers.dk>
Message-ID: <185890.9723.qm@web23501.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have this problem using the foreigh toolchain. Can anyone know how to fix
it?

libtool: relink: /usr/share/gnush4-nofpu_linux_v0701-1/bin/sh3-linux-gcc -Os -pipe -Os  --sysroot /home/michael/lavoro/renesas/buildroot/output/build/staging_dir/ -shared  .libs/gmodule.o   -Wl,-rpath -Wl,/home/michael/lavoro/renesas/buildroot/output/build/staging_dir/usr/lib -ldl -L/home/michael/lavoro/renesas/buildroot/output/target/usr/lib -L/usr/lib -lglib-2.0 -L/home/michael/lavoro/renesas/buildroot/output/build/staging_dir/usr/lib -L/home/michael/lavoro/renesas/buildroot/output/target/home/michael/lavoro/renesas/buildroot/output/build/staging_dir/usr/lib -lintl -lc  -Wl,--export-dynamic   -Wl,-soname -Wl,libgmodule-2.0.so.0 -o .libs/libgmodule-2.0.so.0.2000.5
/usr/lib/libdl.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status
libtool: install: error: relink `libgmodule-2.0.la' with the above command before installing it





      
