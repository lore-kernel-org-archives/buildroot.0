From: aurelien coulaud <aurelien.coulaud@thalesgroup.com>
Date: Wed, 6 Apr 2016 17:18:05 +0000 (UTC)
Subject: [Buildroot] migrating manual makefile to autotools-based
	packages
References: <loom.20160406T145801-819@post.gmane.org>
Message-ID: <loom.20160406T191601-706@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aurelien coulaud <aurelien.coulaud@...> writes:

> 
> Hello,
> 
> I am using an old buildroot 2011 with external packages using manual
makefiles.
> 
> Now I am migrating to buildroot 2016.02 and this doc
> (http://free-electrons.com/~thomas/buildroot/manual/html/ch11.html) explains
> that manual makefile are now obsolete.
> 
> and the official doc of buildroot does not mention manual makefile :
> https://buildroot.org/downloads/manual/manual.html
> 
> manual makefile is not supported on 2016.02, I am right ?
> Is there a way to continue to use manual makefile?
> 
> Otherwise is there a tool to migrate easily manual makefile to
autotools-based ?
> 
> Thank you for your answer.
> Best regards,
> 
> AC
> 

hello I found the solution into this slides (page 272):
http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf

"Note: as of Buildroot 2015.05,
TARGETS
has been renamed to
PACKAGES"

So now my old Package with manual makefile compiles.

Bye,
