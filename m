From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2020 10:33:06 +0200
Subject: [Buildroot] [git commit] package/php: drop
 BR2_PACKAGE_PHP_EXT_HASH
In-Reply-To: <20200824082506.GB10811@scaer>
References: <20200823165655.328FB814F6@busybox.osuosl.org>
 <20200823190650.7bc12a8a@windsurf.home>
 <20200824082506.GB10811@scaer>
Message-ID: <20200824083306.GC10811@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-08-24 10:25 +0200, Yann E. MORIN spake thusly:
> On 2020-08-23 19:06 +0200, Thomas Petazzoni spake thusly:
> > On Sun, 23 Aug 2020 19:03:20 +0200
> > Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > > +config BR2_PACKAGE_PHP_EXT_HASH
> > > +	bool "php hash extension is mandatory"
> > > +	select BR2_LEGACY
> > > +	help
> > > +	  Since php 7.4.0, hash extension can't be disabled.
> > In this sort of situation, we generally don't add any legacy handling.
> > Indeed, since the feature is now mandatory... the default behavior will
> > always be OK.
[--SNIP--]
> Damn. indeed... I'll push a commit to drop it.

While doing so, I notice we do have similar now-mandatory options from
the EFL package, with commit 6deaa3d50de (package/efl: bump to version
1.23.2).

Shall I drop those too?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
