From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 11:50:13 +0200
Subject: [Buildroot] [PATCH v5 17/34] package/libsquish: remove
 deprecated package
In-Reply-To: <rg8usdxbil.ln2@ID-313208.user.individual.net>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-18-bernd.kuhls@t-online.de>
 <20170423085010.GJ2819@scaer>
 <rg8usdxbil.ln2@ID-313208.user.individual.net>
Message-ID: <20170423095013.GC7228@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-23 11:25 +0200, Bernd Kuhls spake thusly:
> Am Sun, 23 Apr 2017 10:50:10 +0200 schrieb Yann E. MORIN:
> 
> > Bernd, All,
> > 
> > On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> >> Kodi removed the dependency for libsquish:
> >> https://github.com/xbmc/xbmc/commit/
> ed03f828be3615d294eb4a4cfccc5cdccec22997
> >> 
> >> Signed-off-by: Bernd Kuhls
> >> <bernd.kuhls@t-online.de>
> > 
> > NAK.
> > 
> > This package is still alive (last release in March this year), and it
> > can very well be used by other packages beside Kodi.
> > 
> > Please leave this package alone. ;-)
> > 
> > Regards,
> > Yann E. MORIN.
> 
> Hi Yann,
> 
> ok, but what about removing 0001-kodi.patch, it is really not needed 
> anymore.

Yep. And maybe bump to 1.15 at the same time? ;-)

Of course, this should be postponed late in the series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
