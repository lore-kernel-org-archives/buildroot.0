From: Ed Swierk <eswierk@arastra.com>
Date: Fri Jul 21 16:32:15 2006
Subject: [Buildroot] [PATCH] bash 3.1 compile error with parallel make
Message-ID: <c1bf1cf0607211625q589f6d5bx48624c63048d1686@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The attached patch fixes a compile error that sometimes occurs when
building bash with parallel make (-j2 or higher), due to a missing
dependency.

Actually it's a patch of a patch (bash31-018), so I've attached both.

--Ed
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-bash-parallel-make.patch
Type: text/x-patch
Size: 643 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060721/40a3041d/buildroot-bash-parallel-make.bin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: bash31-018
Type: application/octet-stream
Size: 462 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060721/40a3041d/bash31-018.obj
