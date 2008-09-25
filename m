From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 25 Sep 2008 08:05:15 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  sdl_net
In-Reply-To: <87hc851td5.fsf@macbook.be.48ers.dk>
References: <20080924120700.012E6F8008@busybox.net>
	<87hc851td5.fsf@macbook.be.48ers.dk>
Message-ID: <20080925080515.437b27cc@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Sep 2008 17:00:38 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "egtvedt" == egtvedt  <egtvedt@uclibc.org> writes:
> 
>  egtvedt> Author: egtvedt
>  egtvedt> Date: 2008-09-24 05:06:59 -0700 (Wed, 24 Sep 2008)
>  egtvedt> New Revision: 23463
> 
>  egtvedt> Log:
>  egtvedt> SDL_net: add new package SDL_net
> 
>  egtvedt> +SDL_NET_INSTALL_STAGING = YES
>  egtvedt> +SDL_NET_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR)
>  egtvedt> install
> 
> That's afaik default.
> 

Doh

>  egtvedt> +
>  egtvedt> +SDL_NET_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
> 
> Shouldn't that be install-strip?
> 

Probably, doh

I'll test and fix :)

-- 
Best regards,
Hans-Christian Egtvedt
