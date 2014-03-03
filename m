From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Mar 2014 19:28:38 +0100
Subject: [Buildroot] [PATCH] glibc: needs MMU
In-Reply-To: <5314C828.3000905@zacarias.com.ar>
References: <1393870807-20546-1-git-send-email-yann.morin.1998@free.fr>
 <5314C828.3000905@zacarias.com.ar>
Message-ID: <20140303182838.GD3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-03-03 15:21 -0300, Gustavo Zacarias spake thusly:
> On 03/03/2014 03:20 PM, Yann E. MORIN wrote:
> 
> >  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> >  	bool "uClibc"
> > +	depends on BR2_USE_MMU
> >  	select BR2_TOOLCHAIN_USES_UCLIBC
> >  	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
> >  		   BR2_avr32   || BR2_bfin   || BR2_i386   || BR2_m68k     || \
> 
> Oops? (UCLIBC)
> Regards.

Doh... Serves me right for not being careful enough...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
