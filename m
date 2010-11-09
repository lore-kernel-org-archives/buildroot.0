From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 9 Nov 2010 17:45:40 +0100
Subject: [Buildroot] What is procedure for building custom Linux-2.6.36
 from BuildRoot?
In-Reply-To: <20101108163354.35840@gmx.com>
References: <20101108163354.35840@gmx.com>
Message-ID: <AANLkTin_UbOpJG-j9tK5s13M-2D3o-Ncy2NTkX-MnDmJ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

From the buildroot configuration tool, in the kernel submenu, you can
select a "custom tarball" kernel (which might be a 2.6.36 in your
case) and also a "custom config file".

But if you're going to hack on your kernel, it make sense to make a
separate build.

Regards,

--
Lionel Landwerlin

On Mon, Nov 8, 2010 at 5:28 PM, Charles Martel <SingerIsland@gmx.com> wrote:
> I noticed that BuildRoot will build a linux-2.6.36 kernel using default
> values.? What is the procedure for building a custom build of the Linux
> kernel?
>
> Specifically, BuildRoot builds SPI Drivers as modules (.ko) by default.? I'd
> like to have the SPI Drivers built-in (Y instead of M) and also have the
> UserSpace SPIDEV built.
>
> Can this be done from BuildRoot or must I rebuild the Linux kernel after
> building the BuildRoot filesystem?
>
> Also, I had to modify the Makefile to not wipe out the Linux .config file
> when I execute "make clean".? Is there a better way to store the customized
> values in Linux .config as part of the BuildRoot build configuration?
>
> Thanks.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
