From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Mon, 02 Aug 2010 13:19:03 +0100
Subject: [Buildroot] undefined reference to dlsym dlopen dlclose
Message-ID: <1280751543.5624.3.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, can anyone help me on this ? 

As you may know, from this ML, I am trying compiling some apps to mipsel
arch , and now with git version I am stuck on this error. 

../gmodule/.libs/libgmodule-2.0.so: undefined reference to `dlsym'
../gmodule/.libs/libgmodule-2.0.so: undefined reference to `dlopen'
../gmodule/.libs/libgmodule-2.0.so: undefined reference to `dlclose'
collect2: ld returned 1 exit status
make[5]: *** [gio-querymodules] Error 1
make[5]: Leaving directory
`/home/sergio/hardware/moviecube/buildroot/output/build/libglib2-2.24.1/gio'

Any feedback is appreciated 
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3293 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100802/588f27e5/attachment.bin>
