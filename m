From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Fri, 4 Mar 2016 10:55:34 +0100
Subject: [Buildroot] Build failure with Vivante and QT5 w/ eglfs
Message-ID: <20160304095534.GA16799@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've run into a build failure while compiling an image, when building
QT5. I made some build tests to narrow down the issue and found the
configuration leading to this: when compiling an image with both
BR2_PACKAGE_QT5BASE_EGLFS and BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 the
build fails with the following error:

http://code.bulix.org/qxj1bn-92391?raw

I understand this configuration can't work, but as this leads to a
build issue we might need to think about a solution. We could disallow
such a configuration tuple, or fix the build.

Any idea?

Thanks,

Antoine

-- 
Antoine T?nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160304/3840cc84/attachment.asc>
