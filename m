From: Mohamed HAMZAOUI <requinham@gmail.com>
Date: Fri, 24 Feb 2012 21:08:56 +0100
Subject: [Buildroot] [U-Boot] Craneboard with Uboot and xloader
In-Reply-To: <20120224150232.GA2346@bill-the-cat>
References: <CABMxt4ic6cZ_xfrtkouKkw2OWSbOiL95tXrz9XgKyqUAd4U-6A@mail.gmail.com>
 <20120224150232.GA2346@bill-the-cat>
Message-ID: <CABMxt4hMc3CjnjFEQNTjzsfxyXgBoyO8uMg1xsmaTeZ2pWXRRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your help, but i use the 2012.12RC version and in the
bootloader menu i select the u-boot version 2011.12 and in the uboot binary
format i only have u-boot.bin, u-boot-nand.bin, u-boot.kwb !
How to build u-boot.img ?
when i used a u-boot.bin for my Craneboard i can't boot because it need a
MLO (xloader) for booting.

thx

On Fri, Feb 24, 2012 at 4:02 PM, Tom Rini <trini@ti.com> wrote:

> On Fri, Feb 24, 2012 at 10:25:21AM +0100, Mohamed HAMZAOUI wrote:
> > Hi,
> >
> > I want to use Buildroot for CraneBoard...
> >
> > My problem is with configuration files : MLO, u-boot.bin and uImage.
> > I installed the last RC buildroot and after I started to configure the
> build
> >  by selecting the desired setting because i dont found a defconfig file
> for
> > Kernel with buildroot ...
>
> Starting with v2011.12 you do not need x-loader and you want the MLO and
> u-boot.img (NOT u-boot.bin) files created by U-Boot.
>
> --
> Tom
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120224/a32d27ee/attachment.html>
