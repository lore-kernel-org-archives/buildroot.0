From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 29 Sep 2007 22:30:06 +0200
Subject: [Buildroot] Recent touch of gcc-uclibc-3.mk [was: Re:
	svn	commit: trunk/buildroot/toolchain/gcc]
In-Reply-To: <20070929182407.GR20951@aon.at>
References: <20070929173259.431383003F@busybox.net>
	<20070929182407.GR20951@aon.at>
Message-ID: <1191097806.5322.279.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-09-29 klockan 20:24 +0200 skrev Bernhard Fischer:
> On Sat, Sep 29, 2007 at 10:32:59AM -0700, ulf at uclibc.org wrote:
> >Author: ulf
> >Date: 2007-09-29 10:32:58 -0700 (Sat, 29 Sep 2007)
> >New Revision: 20117
> >
> >Log:
> >Use linke to build-time-tools, disable libssp which does not work for cross-compile
> 
> What do you mean by "Use linke"?
> 
Spelling error

> Also, generally disabling libssp doesn't sound like a bright idea; I
> don't remember any trouble when cross-compiling from i686->i386-uclibc
> so i'm not too excited by you hardcoding that.

Net is full of comments on liubssp not beeing able to cross-compile.

I am going to change this to be an extra config option if
BR2_avr32 is selected, (as libmudflap)

> Oh, and you checked *thoroughly* not to break gcc-3.4.6, did you?

BR
Ulf Samuelsson
