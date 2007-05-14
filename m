From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 14 May 2007 17:34:09 +0200
Subject: [Buildroot] kernel patch not applied
In-Reply-To: <1179156353.21753.31.camel@localhost.localdomain>
References: <46432A7D.6050808@rcn.com> <46433B79.50101@rcn.com>
	<1178893909.11554.75.camel@localhost.localdomain>
	<20070511154059.GA4710@aon.at>
	<1179120085.21753.1.camel@localhost.localdomain>
	<20070514071131.GA11391@aon.at>
	<1179156353.21753.31.camel@localhost.localdomain>
Message-ID: <20070514153409.GA27033@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 14, 2007 at 05:25:53PM +0200, Hans-Christian Egtvedt wrote:

>> >Weird, I tried zsh, bash and sh. I am building on Ubuntu 7.04.
>> 
>> IIRC ubuntu defaults to dash as sh, so make sure that
>> a) SHELL points to /bin/bash (ash may work too)
>> or,
>
>Aha, setting SHELL to /bin/bash makes this work, thanks.
>
>Perhaps the top level Makefile should modify SHELL for you?

The user is supposed to set the environment he wants to use.
This includes but is not limited to SHELL, HOSTCXX, HOSTCC, MAKE etc,
etc.
