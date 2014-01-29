From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jan 2014 07:35:10 +0100
Subject: [Buildroot] [PATCH 1/2] rings: add the version major variable
In-Reply-To: <52E831CB.3000503@trzebnica.net>
References: <1389695458-19578-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20140128225847.35ae8d12@skate> <52E831CB.3000503@trzebnica.net>
Message-ID: <20140129073510.1ed5a020@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Tue, 28 Jan 2014 23:40:11 +0100, Jerzy Grzegorek wrote:

> >> -RINGS_VERSION = 1.3.0-1
> >> +RINGS_VERSION_MAJOR = 1.3.0
> >> +RINGS_VERSION = $(RINGS_VERSION_MAJOR)-1
> >>   RINGS_SUBDIR  = rings-v_1_3_0
> >>   RINGS_LICENSE = MIT
> > While I agree with <foo>_VERSION_MAJOR, when <foo>_VERSION_MAJOR is
> > used in more than one place, I don't necessarily think it is needed
> > when it is used in only one place, <foo>_VERSION.
> >
> > Thomas
> 
> I think, you didn't read my second patch:
> [PATCH 2/2] package: unification of use $(subst 
> [._-],[._-],$(<PKG>_VERSION)) macro

Ah, yes, right. Sorry for this: as I said, I reading and replying to
the e-mail traffic in a FIFO manner, so I sometimes miss things.

It would probably have been nice to mention in the commit log why it
was necessary (for the next patch).

Anyway, thanks a lot for all these cleanup and coherency improvements,
there are very appreciated!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
