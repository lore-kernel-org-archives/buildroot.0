From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Aug 2012 11:37:31 +0200
Subject: [Buildroot] [PATCH 20/20] external-toolchain: add Sourcery
	CodeBench ARM 2012.03
In-Reply-To: <503D49F2.1000501@mind.be>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <201208221636.16437.yann.morin.1998@free.fr> <503D49F2.1000501@mind.be>
Message-ID: <201208291138.13363.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On Wednesday 29 August 2012 00:45:06 Arnout Vandecappelle wrote:
> On 08/22/12 16:36, Yann E. MORIN wrote:
> >> >  I'm a bit hesitant here. If newer glibc toolchains re-include the RPC
> >> >  support, is it worth supporting libtirpc and do all the changes I had
> >> >  proposed? Or should we just give up and say we only support
> >> >  glibc toolchains that include RPC support? Maybe not nice, since
> >> >  libtirpc brings quite a few features compared to in-toolchain RPC
> >> >  support.
> >> >
> >> >  Comments from others?
> > In the end, I don not think that your work on libtirpc is still valuable,
>                  ^^^^^^^not???

Of course, I meant: I *do* think it is valuable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
