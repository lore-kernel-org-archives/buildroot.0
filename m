From: nfrench at xtale.biz <nfrench@xtale.biz>
Date: Wed, 15 Jul 2009 21:16:54 -0000 (Europe/London)
Subject: [Buildroot] clean build
Message-ID: <59693.172.16.221.250.1247692614.squirrel@cvs.xtale.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



What is the best way to do a clean build after changing an item in
menuconfig it seems that a 
make clean followed by 
make

does not rebuild everything ie if I have changed the compiler
flags.

if I do

make distclean

I have to
do a make menuconfig before a make this also means that all the packages
are dowloaded again.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090715/50091349/attachment.htm>
