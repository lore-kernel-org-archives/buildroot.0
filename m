From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 8 Jan 2009 09:25:45 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231355808.32308.414.camel@elrond.atmel.com>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<1231243376.32308.52.camel@elrond.atmel.com>
	<87vdsssiwo.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
	<1231326832.32308.320.camel@elrond.atmel.com>
	<87prizl5im.fsf@macbook.be.48ers.dk>
	<1231330238.32308.334.camel@elrond.atmel.com>
	<20090107181337.GB14648@zelow.no>
	<1231355808.32308.414.camel@elrond.atmel.com>
Message-ID: <20090108082545.GC17480@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 07, 2009 at 08:16:48PM +0100, Ulf Samuelsson wrote:
> 
> When we release a distribution, then all needed packages
> in that distribution needs to be mirrored somewhere.

Maybe not just right then but later, yes. The Linux kernel and gcc 
does not have to be a part of this scheme since they are all available
at the source. I guess a few other packages might also be like that.

The other option is to always mirror and use one download source 
for all packages except the ones mentioned above.

This will require some disk space and bandwidth but not nessesarily 
that much since many of the biggest tarballs does not need 
to be mirrored.

> This was a key requirement when I pestered Atmel Norway 
> to replace their build scripts with buildroot,
> and I think HCE has implemented it.
> There is a scripts/wget.sh which I will have a look at.

make source might work but not tested.


Thomas.
