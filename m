From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jan 2013 23:17:47 +0100
Subject: [Buildroot] [PATCH 2/3] rpi-userland: new package
In-Reply-To: <CAGduivxwksjePX5pyFrSDggHC+u2pNydA6nDqZJ1x5MNsFEdzA@mail.gmail.com>
References: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <87ehhyc6al.fsf@dell.be.48ers.dk>
 <CAGduivxwksjePX5pyFrSDggHC+u2pNydA6nDqZJ1x5MNsFEdzA@mail.gmail.com>
Message-ID: <201301062317.47272.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Sunday 06 January 2013 Maxime Hadjinlian wrote:
> On Sun, Jan 6, 2013 at 11:09 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
> >
> >  Maxime> Introducing a package to build the userland part of the Raspberry,
> >  Maxime> needed by anyone who would want to build a rootfs for a RaspberryPi.
> >
> > Presumably it isn't REALLY needed, right? Only if you want to use the
> > GPU?
> I actually don't know if you could do without it since the rpi only
> video output is the HDMI.
> I'll have to check about that.

I am running one rpi headless, so I don't need the GPU-related userland
on this rpi.

It is needed only if you plan on doing graphics, so it is not strictly
/required/ per-se.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
