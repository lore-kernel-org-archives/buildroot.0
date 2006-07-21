From: Ed Swierk <eswierk@arastra.com>
Date: Fri Jul 21 16:48:30 2006
Subject: [Buildroot] [PATCH] iproute2 configure fails
Message-ID: <c1bf1cf0607211629r3e01b58fsb88ece07e7d654ee@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script in iproute2-2.6.14-051107 has the wrong mode, so
it cannot be executed directly. The attached patch changes iproute2.mk
to run the configure script inside a shell, as a workaround for this
bug.

--Ed
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-iproute2-configure.patch
Type: text/x-patch
Size: 430 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060721/3b113587/buildroot-iproute2-configure.bin
