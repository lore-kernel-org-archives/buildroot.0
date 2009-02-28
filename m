From: IaMaPlAyEr <iamaplayer@gmail.com>
Date: Sat, 28 Feb 2009 10:49:09 +0800
Subject: [Buildroot] I want to know how the buildroot works inside when
	build and install a new package
In-Reply-To: <20090227223049.4cb8362a@surf>
References: <2ae8403e0902261945w682609fbwa4758e1bcf01f742@mail.gmail.com>
	<20090227223049.4cb8362a@surf>
Message-ID: <2ae8403e0902271849o73d3e76do4614e837ac83c55a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
    Thanks for your warmhearted reply.
    I know your meaning, but it is not my question.
    Sorry for my ability that not express my question clearly.

I want to know how the foo.mk(the example in doc of buildroot) pass
parameter to the autotools or ./configure, or make.
Not only just use
FOO_INSTALL_TARGET = YES
FOO_AUTORECONF=YES
but how the parameter will be used in Makefile.autotools.in or something
else?

Of course I need to read the Makefile.autotools.in by myself, but I just
want to know the panorama how the parameter pass to ./configure or make.

And if i want to comprehend and improve the Makefile.autotools or the
mechanism of parameter transfer, the first step is to know how it works now.

btw, do you know the OpenWRT? It also based on buildroot, and it has his own
packages mechanism just like i2c-tools:
https://svn.openwrt.org/openwrt/packages/utils/i2c-tools/
https://svn.openwrt.org/openwrt/packages/utils/i2c-tools/Makefile

...
include $(TOPDIR)/rules.mk

PKG_NAME:=i2c-tools
PKG_VERSION:=3.0.1
PKG_RELEASE:=1
...





If i comprehend two things(makefile in OpenWrt and foo.mk in buildroot),
maybe we can added more and more packages in buildroot by the hands of
OpenWrt.






On Sat, Feb 28, 2009 at 5:30 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> ....
>
>  ./configure
>  make
>  make install
>
>
> FOO_AUTORECONF=YES
>
> ....
>
> Sincerly,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _____________________________________________<http://lists.busybox.net/mailman/listinfo/buildroot>




-- 
Sincerly,

HaveF
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090228/bbb99d1e/attachment.htm>
