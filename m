From: JS <js@hipro.co.in>
Date: Tue, 04 Mar 2008 11:50:49 +0530
Subject: [Buildroot] To fix the build failure of xlib_liblbxutil, xlib_libX11,
	xlib_libXt
Message-ID: <1204611649.4313.7.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am building for mipsel. And, I had to do the following modifications
to get x11r7 to build. I have not tested the binaries yet (they are
still getting built) so dont know whether these are right.

Please can someone look into these patches and tell me whether I am
missing something.

-- 
HiPro Solutions
http://hipro.co.in/

-------------- next part --------------
A non-text attachment was scrubbed...
Name: xlib.diff
Type: text/x-patch
Size: 2737 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080304/fd2ca2c1/attachment.bin 
