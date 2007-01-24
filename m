From: Lars Munch <lars@segv.dk>
Date: Wed, 24 Jan 2007 21:29:42 +0100
Subject: [Buildroot] [PATCH] Add local directory for non-public packages
In-Reply-To: <1169650922.21018.4.camel@elrond.sweden.atmel.com>
References: <1169593120.5361.17.camel@elrond.sweden.atmel.com>
	<20070124001104.GB17761@codepoet.org>
	<8558857.post@talk.nabble.com>
	<1169650922.21018.4.camel@elrond.sweden.atmel.com>
Message-ID: <20070124202942.GA21800@tuxedo.home.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ulf

On Wed, Jan 24, 2007 at 04:02:02PM +0100, Ulf Samuelsson wrote:
> Here is an updated patch which includes the local/Config.in.
> As I explained in the previous Email, the "package/customize"
> and "local" have two distinct functions.
> If you move up "buildroot/package/customize" to "buildroot/customize"
> and make the "Config.in" and "customize.mk" empty,
> then that would be ok as well.
[snip]

I really like this idea of having a directory for "local" packages, but I
think it would be nice to take it a step further and make it possible to
set the directory where the "local" packages are located. Then it will be
possible to have your "local" packages out of the buildroot tree.

Just my 2 cent.

-- Lars Munch
