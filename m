From: David Sanchez Herrero <david.krusty@gmail.com>
Date: Wed, 12 Sep 2012 11:23:01 +0200
Subject: [Buildroot] Uncompressed kernel image for ARM architecture
	(Raspberry)
In-Reply-To: <CAAfyv35=m_nHK_mRqdRVdZ9RY8i7=dLv9BNsc4mHxP+LGpXEKA@mail.gmail.com>
References: <CAMPeO9yjDwyhqpA0nOwLcp25cponBsP_OC_J4T7+22Jj_OzoaA@mail.gmail.com>
 <CAAfyv35=m_nHK_mRqdRVdZ9RY8i7=dLv9BNsc4mHxP+LGpXEKA@mail.gmail.com>
Message-ID: <CAMPeO9z2jkbBe_Jh5y5Hj59gbZSR2rc_4ODfPDSKPmgOjxc1Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again Belisko,

Yes, I have seen your mail a few minutes ago, but thanks for the notice!!!
;)

One question: when are the new funcionalities going to be released?? In the
next Builroot release, I suppose....

Greetings, David.

2012/9/12 Belisko Marek <marek.belisko@gmail.com>

> Hi David,
>
> On Mon, Sep 10, 2012 at 3:01 PM, David Sanchez Herrero
> <david.krusty@gmail.com> wrote:
> > Hi all,
> >
> > Is there a way to obtain uncompressed kernel image for ARM architecture?
> >
> > I'm trying to build a kernel and a root filesystem for Raspberry Pi from
> an
> > internal buildroot toolchain with uClibc, but the only supported formats
> for
> > the output kernel image are vmlinux, uImage and zImage.
> >
> > Downloading the kernel sources from the Raspberry Git repositories, and
> > building them manually, an image file called "Image" is generated under
> > ".arch/arm/boot/" folder, but this file doesn't exists if the building
> > process of the same sources is made by Buildroot. It will prepare boot
> partition
> for RPI automatically.
> Maybe you've seen that but to be sure ;):
> http://lists.busybox.net/pipermail/buildroot/2012-September/058499.html
> >
> > Maybe using BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM?
> >
> > Thanks in advance.
> >
> > Greeting, David.
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> Cheers,
>
> marek
>
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120912/b36d27a5/attachment.html>
