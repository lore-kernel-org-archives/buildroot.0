From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 21 Oct 2015 22:56:00 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <20151019134532.GA12643@laptop-vstehle>
References: <20151019134532.GA12643@laptop-vstehle>
Message-ID: <5627FBE0.5010004@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent, All,

Le 19/10/2015 15:45, Vincent Stehl? a ?crit :
> Hi Guillaume and Romain,
> 
> Thank you for your effort on this nice sdl2 buildroot patch. I hope you
> are still working on it.

Actually no, I only reviewed it after the Buildroot summer camp and sent an
updated version. Since then it's waiting for a reviewer or tester ;-)

> 
> While trying v5 of the path recently, as found in buildroot patchwork, I
> needed to add the following line to sdl2.mk:
> 
> 	SDL2_CONFIG_SCRIPTS = sdl2-config
> 
> Without this line, the include path returned by `sdl2-config --cflags`
> will be something like /usr/include/SDL2, instead of pointing to the
> buildroot staging dir.
> 
> You might want to add it to a v6, maybe?

Thanks for the feedback ! You're probably right, I need to rebuild it locally to
check.

I used it to enable the sdl2 support during the development of my efl patches
series, I didn't see any build issue even with the paranoid toolchain wrapper
enabled... (but the sdl2-config is probably not used)

> 
> Apart from that, it works fine for me, thanks!

Great!
I'll send an updated version with your fix, can you send your tested and/or
reviewed tag ;-)

Best regards,
Romain

> 
> Best regards,
> 
> V.
> 
