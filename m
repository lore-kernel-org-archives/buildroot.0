From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Tue, 21 Oct 2008 12:20:37 +0200
Subject: [Buildroot] ext2+isofs initrd too big
In-Reply-To: <e4c675870810201631r2552ef49waa6c5ec760d8c918@mail.gmail.com>
References: <e4c675870810181157u69e5e3d4j3ed89b53a414c6f3@mail.gmail.com>
	<e4c675870810181256j11da9c1eha5035bedc7a088a4@mail.gmail.com>
	<e4c675870810181655x1bdf8817l114da029a3a9c807@mail.gmail.com>
	<e4c675870810190300h6274b470nefb816ae6798d301@mail.gmail.com>
	<20081019160520.GI11249@mx.loc>
	<e4c675870810200355g55367c71x351b2ed4ff49751f@mail.gmail.com>
	<e4c675870810200532j2d8412dckfb0593b73eb45938@mail.gmail.com>
	<e4c675870810201631r2552ef49waa6c5ec760d8c918@mail.gmail.com>
Message-ID: <e4c675870810210320i16e09477k5530ae86ef587e1c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/21 Roberto A. Foglietta <roberto.foglietta@gmail.com>:

[...]

>
> 2056    kernel
> 3940    lib/modules
> ====
> 5996    20.7% (kernel)
>
> 1768    busybox + rootfs + lib + everything else
> ====
> 1768    6.1% (system)
>

 For sake of completeness the kernel is for eeepc where its .config
has been modified in order to have statically built-in all eeepc
peripherals and modules for every usb pug-able hw. This is the reason
because it is so big and system too. However reading posts in this
m-list I realized that this kind of things are not interesting for the
most of the people living with buildroot.


 Cheers,
-- 
/roberto
