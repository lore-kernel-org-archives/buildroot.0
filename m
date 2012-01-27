From: Willy <willy@willygroup.org>
Date: Fri, 27 Jan 2012 14:38:23 +0000 (UTC)
Subject: [Buildroot] gtkmm in buildroot toolchain
References: <loom.20120127T095631-99@post.gmane.org>
 <20120127111928.3e881f03@skate> <loom.20120127T145617-861@post.gmane.org>
 <201201270827.51630.minimod@morethan.org>
Message-ID: <loom.20120127T153354-348@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael S. Zick <minimod@...> writes:

> > Perhaps do I install those *mm library manually one by one? 
> >
> 
> That is one choice.
> 
> Might be worth the effort of writing another makefile for each,
> setting your dependencies in the gtkmm makefile to depend on them,
> then let Buildroot build the entire set.

That's too much complicated for me :(

Maybe this time I will install the libraries one by one, then when I will be
more confident with the use of Makefiles I will try the other way.

Thanks a lot,
Willy
