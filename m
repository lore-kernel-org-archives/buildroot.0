From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Jan 2009 10:10:16 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <20090108082545.GC17480@zelow.no> (Thomas Lundquist's message of
	"Thu\, 8 Jan 2009 09\:25\:45 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<1231243376.32308.52.camel@elrond.atmel.com>
	<87vdsssiwo.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
	<1231326832.32308.320.camel@elrond.atmel.com>
	<87prizl5im.fsf@macbook.be.48ers.dk>
	<1231330238.32308.334.camel@elrond.atmel.com>
	<20090107181337.GB14648@zelow.no>
	<1231355808.32308.414.camel@elrond.atmel.com>
	<20090108082545.GC17480@zelow.no>
Message-ID: <87hc4arwnb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Lundquist <lists@zelow.no> writes:

Hi,

 >> When we release a distribution, then all needed packages
 >> in that distribution needs to be mirrored somewhere.

 Thomas> Maybe not just right then but later, yes. The Linux kernel and gcc 
 Thomas> does not have to be a part of this scheme since they are all available
 Thomas> at the source. I guess a few other packages might also be like that.

 Thomas> The other option is to always mirror and use one download source 
 Thomas> for all packages except the ones mentioned above.

I would prefer a backup system like what we have for
Makefile.autotools.in - E.G. try the upstream location first, and only
if that fails go to the mirror.

 Thomas> make source might work but not tested.

It does work, but it ofcourse only downloads the package(-versions)
you are using.

-- 
Bye, Peter Korsgaard
