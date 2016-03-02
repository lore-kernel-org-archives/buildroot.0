From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 2 Mar 2016 21:48:46 +0100
Subject: [Buildroot] [PATCH] package/sdl_mixer: disable libmad support
 for static build only
In-Reply-To: <CABLs7GUZJRTddPMzP99Qz4N2AcKL4OZK5UMJ1vDxS9vh-=_M6Q@mail.gmail.com>
References: <1456073708-19562-1-git-send-email-romain.naour@gmail.com>
 <20160221181830.01215f6e@free-electrons.com>
 <CABLs7GUZJRTddPMzP99Qz4N2AcKL4OZK5UMJ1vDxS9vh-=_M6Q@mail.gmail.com>
Message-ID: <56D751AE.2060300@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rodrigo, Thomas, All,

Le 21/02/2016 21:06, Rodrigo Rebello a ?crit :
> Thomas, Romain,
> 

[snip]

> 
> I don't think this workaround is necessary at all. Adding a
> 'Libs.private' section to SDL_mixer.pc and fixing packages that depend
> on SDL_mixer so that they use pkg-config doesn't seem too complicated.
> Currently only chocolate-doom, lbreakout2, ltris and prboom depend on
> it.
> 
> I'll work on a patch for chocolate-doom now and handle the other 3 later.

I'll will mark this patch rejected in patchwork.

Thanks for working on this.

Best regards,
Romain

> 
> Regards,
> Rodrigo
> 
