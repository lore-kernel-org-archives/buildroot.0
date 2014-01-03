From: Bryce Schober <bryce.schober@gmail.com>
Date: Fri, 3 Jan 2014 15:54:09 -0800
Subject: [Buildroot] Why is sysroot under i686-buildroot-linux-gnu?
Message-ID: <CAJpxd07vs10v6uhOe3=_a=Rj-40x+Q8yWh0cK+YbTnP1HdzLTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using a custom external toolchain built by crosstool-ng that's a
fairly ordinary configuration, other than using an old gcc-4.3 and
glibc-2.9, ending up with a i686-unknown-linux-gnu toolchain.

Why does buildroot end up installing the toolchain sysroot under
output/host/usr/i686-buildroot-linux-gnu instead of under
output/host/usr/i686-unknown-linux-gnu?

This is causing some problems in some of my external makefiles I have
that expect the sysroot dir to match the toolchain tuple...

<><  <><  <><
Bryce Schober
