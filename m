From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 21:35:42 +0100
Subject: [Buildroot] [PATCHv2] package/sdl_sound: fix constness in debug
 mode
In-Reply-To: <XnsA3E8CD4B466AAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1416250380-24029-1-git-send-email-yann.morin.1998@free.fr>
 <XnsA3E8CD4B466AAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141117203542.GD12473@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-17 20:10 +0100, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:1416250380-24029-1-git-send-email-yann.morin.1998 at free.fr:
> 
> > +# Patch touching configure.in
> > +SDL_SOUND_AUTORECONF = YES
> 
> I think this part of the patch is not necessary anymore ;)

Damn, yes. Will resend. Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
