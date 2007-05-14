From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Mon, 14 May 2007 17:25:53 +0200
Subject: [Buildroot] kernel patch not applied
In-Reply-To: <20070514071131.GA11391@aon.at>
References: <46432A7D.6050808@rcn.com> <46433B79.50101@rcn.com>
	<1178893909.11554.75.camel@localhost.localdomain>
	<20070511154059.GA4710@aon.at>
	<1179120085.21753.1.camel@localhost.localdomain>
	<20070514071131.GA11391@aon.at>
Message-ID: <1179156353.21753.31.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2007-05-14 at 09:11 +0200, Bernhard Fischer wrote:
> On Mon, May 14, 2007 at 07:21:25AM +0200, Hans-Christian Egtvedt wrote:
> >On Fri, 2007-05-11 at 17:40 +0200, Bernhard Fischer wrote:
> >> On Fri, May 11, 2007 at 04:31:49PM +0200, Hans-Christian Egtvedt wrote:

<cut>

> >Weird, I tried zsh, bash and sh. I am building on Ubuntu 7.04.
> 
> IIRC ubuntu defaults to dash as sh, so make sure that
> a) SHELL points to /bin/bash (ash may work too)
> or,

Aha, setting SHELL to /bin/bash makes this work, thanks.

Perhaps the top level Makefile should modify SHELL for you?

<cut solution with symlink>

-- 
Mvh
Hans-Christian Egtvedt
