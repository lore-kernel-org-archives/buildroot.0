From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jan 2011 08:47:48 +0100
Subject: [Buildroot] [PATCH v2 1/4] Makefile: generate CMake
 toolchain-file in $(O)
In-Reply-To: <AANLkTinED=7r462NdPQB7USDn3BxDotAt5c5n_rP7r=r@mail.gmail.com>
References: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
	<1295124808-5649-2-git-send-email-bjorn.forsman@gmail.com>
	<20110126002113.51aeb0f0@surf>
	<AANLkTinED=7r462NdPQB7USDn3BxDotAt5c5n_rP7r=r@mail.gmail.com>
Message-ID: <20110126084748.5b5338f3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jan 2011 01:33:38 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> > Could you also add:
> >
> > + ? ? ? set(ENV{PKG_CONFIG_SYSROOT_DIR} $(STAGING_DIR))\n\
> >
> > This is needed to get CMake pkg-config module to work properly.
> 
> Thanks for the tip.

You're welcome. Thanks for doing this work in the first place.

> > I am not entirely happy with the name/location of the CMake
> > toolchain file, but that's something we can sort out later.
> 
> Or now, if you want :-)  I'm open for suggestions.

I don't have suggestions at the moment. It's related to the future SDK
thing, which isn't completely well-defined at the moment. I'd say let's
keep it how it is for now, unless someone comes up with a better
location/name. We can always change it later on when we have a clearer
idea of what this SDK thing will look like.

> > So, once this change is done, your patch gets my:
> >
> > Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Great!
> 
> By the way, how are 'acked-by's handled? Do I add them to every patch
> in the next series?

Yes, exactly.

Thanks again!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
