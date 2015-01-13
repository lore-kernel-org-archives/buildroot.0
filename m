From: Ravi Chhabra <ravi.chhabra@broadcom.com>
Date: Tue, 13 Jan 2015 17:54:11 +0000
Subject: [Buildroot] image size reduction
Message-ID: <79A788F82B01BC478629DC5CC23739B00275374B@IRVEXCHMB15.corp.ad.broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,

I am trying to boot linux on quad core Aarch64 system with only 8MB on chip RAM which I plan to use for storage and loading the image.

I intend to shrink the size of image file by reducing all possible components and simplifying the build. I am using latest buildroot 14.11 release with ulibc option, no application and minimal busybox options which brought the root filesystem (unzipped cpio) size down to ~3MB which is still quite big.

I would be interested to reduce the size of kernel as well and further reduce the size of filesystem to reduce the size of image (axf file)

Kindly guide the right way to do that.

Thanks,
Ravi C

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150113/af48a1f7/attachment.html>
