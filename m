From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jan 2009 20:39:10 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231355808.32308.414.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 07 Jan 2009 20\:16\:48 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<1231243376.32308.52.camel@elrond.atmel.com>
	<87vdsssiwo.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
	<1231326832.32308.320.camel@elrond.atmel.com>
	<87prizl5im.fsf@macbook.be.48ers.dk>
	<1231330238.32308.334.camel@elrond.atmel.com>
	<20090107181337.GB14648@zelow.no>
	<1231355808.32308.414.camel@elrond.atmel.com>
Message-ID: <87vdsqkish.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> When we release a distribution, then all needed packages
 Ulf> in that distribution needs to be mirrored somewhere.

Agreed (long term atleast).

 Ulf> This was a key requirement when I pestered Atmel Norway 
 Ulf> to replace their build scripts with buildroot,
 Ulf> and I think HCE has implemented it.
 Ulf> There is a scripts/wget.sh which I will have a look at.

From a quick look that script just seems to handle the backup mirror
thing like we have in Makefile.autotools.in.

For populating a mirror you can use make source instead (for all
possible configurations)

-- 
Bye, Peter Korsgaard
