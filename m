From: Alexander Khryukin <alexander@mezon.ru>
Date: Tue, 13 Nov 2012 18:30:40 +0300
Subject: [Buildroot] libgomp.so.1.0.0 not in target image
Message-ID: <CABtOAfzcjFWUVELMn0X4fRF8fcdqBL5HsBzo7sw1wt8JJc+Ghw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.
I'm built rpm5 package but when i trying to run it i see

[root at localhost rpm]# rpmbuild
rpmbuild: error while loading shared libraries: libgomp.so.1: cannot open
shared object file: No such file or directory

Lib not exist in filesystem but exit into


find . -name *gomp*
./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.spec
./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.so.1.0.0
./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.so
./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.a
./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.la
./output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/libgomp.so.1


It's a bug or feature?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121113/8f056b91/attachment.html>
