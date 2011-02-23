From: bruce bushby <bruce.bushby@gmail.com>
Date: Wed, 23 Feb 2011 01:50:44 +0000
Subject: [Buildroot] Buildroot AT91 support
Message-ID: <AANLkTinWjJjMqL_x5gRVKBKQuyo4GkHwMYXkstH9xyUm@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I've been reading most of the pages hosted at:
www.at91.com/linux4sam/bin/view/Linux4SAM/

When I came across:
http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRootBuild#How_to_build_buildroot_for_AT91
<http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRootBuild#How_to_build_buildroot_for_AT91>

In summary...the instructions say:

svn co -r 23434 svn://uclibc.org/trunk/buildroot
patch -p1 < ../buildroot-v23434.patch
make BOARD=AT91 getconfig
make 2>&1 | tee at91sam9.log


Is it safe to consider those instructions as deprecated given the current
buildroot appears to have broad support for AT91 boards?


Thanks
Bruce
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110223/5c9d8912/attachment.html>
