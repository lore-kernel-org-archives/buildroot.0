From: Chris LaRocque <clarocq@gmail.com>
Date: Tue, 11 Sep 2018 17:07:58 -0400
Subject: [Buildroot] BR2_PACKAGE_EXPAT
Message-ID: <CAOURK2sWHUyT8MbQbfhA7wEFPNbt9AxZW=_if7ght8La5Wi_Bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I am building for Beaglebone black and everything is working; except that
now I need libexpat for the target and it is not in sysroot even
though BR2_PACKAGE_EXPAT=y. I searched the archives and found threads
discussing issues with GDB and not wanting libexpat in sysroot but did not
follow why this is an issue.

Could someone enlighten me on why having target libexpat in sysroot is an
issue and also why I can't find the libraries?

Thanks

Chris LaRocque
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180911/ba04e715/attachment.html>
