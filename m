From: Keith Mok <ek9852@gmail.com>
Date: Tue, 5 Dec 2017 11:21:13 -0600
Subject: [Buildroot] [PATCH 1/2] android-tools: Enable build for ext4
 fsutils
In-Reply-To: <20171204112321.mte4qbqtgffu7sjf@t450s.lan>
References: <20171130205631.93251-1-ek9852@gmail.com>
 <20171201124924.ajmy3ibrnlznfddb@t450s.lan>
 <CAHjoi4fMAY3B7kOBfUQ1VNknR27ks-RU+nYGhy3+w609kA+s+w@mail.gmail.com>
 <20171204112321.mte4qbqtgffu7sjf@t450s.lan>
Message-ID: <CAHjoi4ckaCH9VHUAh3vu26MXiVMBwjm0A40mcxTNnoOZfeDVXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just sync with Google, that they are removed make_ext4fs in internal
branch. and merge Android specific things into e2fsprogs.
So we possibly no need this anymore.

Thanks,
Keith


2017-12-04 5:23 GMT-06:00 Gary Bisson <gary.bisson@boundarydevices.com>:

> Hi Keith,
>
> On Fri, Dec 01, 2017 at 10:25:05PM -0800, Keith Mok wrote:
> > Basically depends on BR2_PACKAGE_LIBSELINUX.
> > But BR2_PACKAGE_LIBSELINUX depends on BR2_TOOLCHAIN_HAS_THREADS
> > BR2_STATIC_LIBS BR2_TOOLCHAIN_USES_GLIBC BR2_arc
> > Those dependency are just copied from FASTBOOT.
>
> Yes the 'depends' are ok, no problem there, but a 'comment' section is
> missing. See under the fastboot 'config' section [1].
>
> Regards,
> Gary
>
> [1] https://git.buildroot.net/buildroot/tree/package/
> android-tools/Config.in#n49
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171205/9c97b44a/attachment.html>
