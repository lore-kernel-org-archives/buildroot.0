From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Dec 2015 20:05:01 +0100
Subject: [Buildroot] [PATCH v2] jQuery: introduce external plugin menu
In-Reply-To: <20151222225442.3c06ed95@free-electrons.com>
References: <1438949409-17023-1-git-send-email-yegorslists@googlemail.com>
 <20151222225442.3c06ed95@free-electrons.com>
Message-ID: <20151223190501.GF3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, Thomas, All,

On 2015-12-22 22:54 +0100, Thomas Petazzoni spake thusly:
> Dear yegorslists at googlemail.com,
> 
> On Fri,  7 Aug 2015 14:10:09 +0200, yegorslists at googlemail.com wrote:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> > 
> > List all jQuery plugins in a dedicated menu and remove
> > uneeded jQuery selection.

Hmm... A bit lte to reply, I know, but I tend to prefer we use a
'menuconfig' in that case, like we do for gstreamer, ffmpeg, Kodi, mpd,
Freescale i.MX libraries...

Of course, this means the Kconfig 'source' statement must move to the
jquery's Config.in and the make 'include' statements to jquery.mk.

Right, w ehave many other locations where we still do a simple 'menu'
below a simple 'config', yet there's no reason to keep it that way.

I'll see if I can do something about it. ;-)

Regards,
Yann E. MORIN.

> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> > Changes:
> > 	v2: make packages prompt lowercase and hyphenated
> 
> Applied, thanks.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
