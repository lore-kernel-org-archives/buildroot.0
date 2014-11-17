From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 17 Nov 2014 20:10:53 +0100
Subject: [Buildroot] [PATCHv2] package/sdl_sound: fix constness in debug
	mode
References: <1416250380-24029-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <XnsA3E8CD4B466AAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:1416250380-24029-1-git-send-email-yann.morin.1998 at free.fr:

> +# Patch touching configure.in
> +SDL_SOUND_AUTORECONF = YES
> +

Hi,

I think this part of the patch is not necessary anymore ;)

Regards, Bernd
