From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed, 29 Nov 2006 16:38:50 +0100
Subject: [Buildroot] [Fwd: Re:  SDL_image,
	SDL_ttf & Co (libpng12.So bug)]
In-Reply-To: <456D6B87.7070207@elaxys.com.br>
References: <456AE31F.9020200@elaxys.com.br> <456AE6A3.1020409@elaxys.com.br>
	<1164648470.456b2016bbf49@imp5-g19.free.fr>
	<456D6B87.7070207@elaxys.com.br>
Message-ID: <1164814730.456da98a27eea@imp7-g19.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have tried your "trick" for SDL_image compilation and even if I put the
LDFLAGS you advised I always have the same link error (/usr/lib/libpng12.so pb)

Are you sure it was the only thing you changed ?

Thanks,
Julien

Quoting Claudio Leonel <cls@elaxys.com.br>:

> >>I was using buildroot version 20061111 and managed to
> >>compile SDL_image including the following flags (LDFLAGS) for the
> >>linker.
> >>
> >>$(SDL_IMAGE_DIR)/.compiled: $(SDL_IMAGE_DIR)/.configured
> >>	$(MAKE) LDFLAGS=$(STAGING_DIR)/lib/libpng12.so -C $(SDL_IMAGE_DIR)
> >>	touch $(SDL_IMAGE_DIR)/.compiled
> >>
> >
> >
