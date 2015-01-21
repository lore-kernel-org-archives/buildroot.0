From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Jan 2015 18:23:27 +0100
Subject: [Buildroot] [PATCH] imx6slevk: fix uImage load address
In-Reply-To: <CAKcgs2z+qLKMS3ngtChDwFVAXvxgsBz25Wi3hv116yTiQEN-Tg@mail.gmail.com>
References: <1421578654-11857-1-git-send-email-gilles.talis@gmail.com>
 <20150119223351.GI4217@free.fr>
 <CAKcgs2z+qLKMS3ngtChDwFVAXvxgsBz25Wi3hv116yTiQEN-Tg@mail.gmail.com>
Message-ID: <20150121172327.GA4375@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2015-01-20 16:46 +0100, Gilles Talis spake thusly:
> 2015-01-19 23:33 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > Gilles, All,
> >
> > On 2015-01-18 11:57 +0100, Gilles Talis spake thusly:
> >> i.MX6 SoloLite SoC has a different external memory base address
> >> than the other i.MX6 family SoCs (0x80000000 for i.MX6 SoloLite
> >> vs 0x10000000 for the others).
> >
> > Could you share a pointer to the reference for this, please?
> Yes, this makes sense. Whilst I was looking for this pointer, I
> stumbled across this u-boot mailing list thread where the problem is
> actually solved:
> http://lists.denx.de/pipermail/u-boot/2014-December/199881.html

That's pretty OK to add as a reference (the U-Boot guys probably know
what they are doing! ;-) ).

> Would that be enough? or would you prefer I provide the links to the
> i.MX6 processors reference manuals where the DDR controller base
> address information is stored.

Well, if you have such info, then be free to add, that would be great!
Otherwise, the U-Boot reference should be enough.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
