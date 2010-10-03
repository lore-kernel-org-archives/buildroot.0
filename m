From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Oct 2010 16:22:19 +0200
Subject: [Buildroot] Libtool work: a tentative summary
In-Reply-To: <1286112146.27944.349.camel@coalu.atr>
References: <20100928223652.6dc72083@surf>
	<1286112146.27944.349.camel@coalu.atr>
Message-ID: <20101003162219.62ad7888@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 03 Oct 2010 15:22:26 +0200
Lionel Landwerlin <llandwerlin@gmail.com> wrote:

> Here is what I would like to us to do for the next releases :
> 
> 1) Bump libtool package to 2.2, more and more packages require libtool
> 2.2, and we're stuck to not autoreconfigure them without 2.2. This is
> already creating problems to Thomas when trying to bump host
> libglib/libgtk packages.

  1a) Integrate Martin Banky's proposal so that packages using libtool
      2.2 can work without the need to autoreconfigure them.

> 2) Eventually integrate some patches to libtool 2.2 to be able to
> cross compile autoreconfigured packages.
> 
> 3) When the libtool 2.4 sysroot issue is sorted out, bump to libtool
> 2.4 and get rid of the patches integrated in 2).
> 
> I think 1) is mandatory for 2010.11.

And 1a).

So, I would suggest :

 *) Peter merges Martin Banky's set of patches on libtool
    http://lists.busybox.net/pipermail/buildroot/2010-September/037505.html

 *) Lionel, could you propose a patch that just bumps libtool to 2.2 ?

Lionel, Martin, Peter, what do you think ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
