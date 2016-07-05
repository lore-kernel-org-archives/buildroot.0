From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jul 2016 09:45:26 +0200
Subject: [Buildroot] [PATCH 17/24 v2] package/skeleton: make it a
 virtual package
In-Reply-To: <1aac877d-658c-5ef6-816f-8c6418377674@gmail.com>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <ab993ffd9048d2ca17a0a6a0a4639e039698a2b0.1466622379.git.yann.morin.1998@free.fr>
 <1aac877d-658c-5ef6-816f-8c6418377674@gmail.com>
Message-ID: <20160705074526.GC6533@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-03 12:47 +0200, Romain Naour spake thusly:
> Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> > The skeleton package now only serves as an intermediate package to
> > direct to the real skeleton implementaion.
>                                 ^
> s/implementaion/implementation/

Fixed.

> > This is exactly what a virtual package is. Make it so.
> Great, you already addressed my previous comment :)

Ehehe! ;-)

[--SNIP--]
> > +config BR2_PACKAGE_HAS_SKELETON
> > +	bool
> > +
> > +config BR2_PACKAGE_PROVIDES_SKELETON
> > +	string
> > +	depends on BR2_PACKAGE_SKELETON
> 
> Should it be depends on BR2_PACKAGE_HAS_SKELETON instead ?

Yep, good catch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
