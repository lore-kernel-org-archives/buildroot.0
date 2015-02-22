From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 22:11:17 +0100
Subject: [Buildroot] [PATCH v7] wine: New package
In-Reply-To: <54EA42C0.9010608@dawncrow.de>
References: <54E63769.1050208@dawncrow.de> <20150222204207.GG4016@free.fr>
 <54EA42C0.9010608@dawncrow.de>
Message-ID: <20150222211117.GH4016@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andre, All,

On 2015-02-22 21:57 +0100, Andr? Hentschel spake thusly:
> >> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> >> +	WINE_CONF_OPTS += TARGETFLAGS="-b $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))"
> > 
> > We usually do not indent the variable assignements in conditional
> > blocks.
> 
> I've seen it that way (same goes for the dependencies checking) and i think it's much nicer that way...
> Is this minor enough to keep it that way?

Well, I'd prefer we don't indent, since we don't do that anywhere else
(well, there are a very few packages that do, but they are old, very
old; the rule is not to indent).

> > I'm doing a few test builds, and will respin an amended version of this
> > patch.
> 
> no need for a respin, your comments will simply end up in v8

OK, great!

Just respin it tonight if you don't have more comments shortly.
I know Thomas wanted to look at it and apply it soonish. :-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
