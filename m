From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2014 21:35:19 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-01-08
In-Reply-To: <52D4E04B.7020700@mind.be>
References: <20140109073009.A1897100CCB@stock.ovh.net>
 <20140109191427.GB3713@free.fr> <20140110072938.27628d13@skate>
 <20140111231717.GD3391@free.fr> <52D4E04B.7020700@mind.be>
Message-ID: <20140114203519.GA3328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-01-14 07:59 +0100, Arnout Vandecappelle spake thusly:
> On 12/01/14 00:17, Yann E. MORIN wrote:
> >On 2014-01-10 07:29 +0800, Thomas Petazzoni spake thusly:
[--SNIP--]
> >>The problem of this solution is that the patch you've done cannot be
> >>upstreamed, and therefore we would have to keep AUTORECONF = YES
> >>forever on this package. Maybe we can make the configure.ac test
> >>conditional on whether we're cross-compiling and push the patch
> >>upstream?
[--SNIP--]
> >I really don't know what is best to do. I think I'll do the above and
> >try to get the patch upstreamed. Let's see what hey think about it.
>  What should definitely be upstreamable, is to add a cache variable for this
> option. Then we can set the cache variable from buildroot like we do for so
> many other things already.

He, that's indeed a good idea!

It turned out to be not so easy, since their configure.ac and helpers
are not really nicely coded, but I managed to do something that looks to
be working.

Patches are on their way to the list, and after reviews, I'll try to
upstream them (after rebasing onto their master, which as changed a
lot).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
