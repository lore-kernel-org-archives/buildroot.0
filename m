From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 2 Feb 2007 16:51:32 +0100
Subject: [Buildroot] Configuring for different backends?
References: <8768090.post@talk.nabble.com>
Message-ID: <020901c746e2$0ee59a70$0c0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> I am looking at using buildroot to compile me a GTK running on DirectFB
> This has various dependencies like
> Cairo,
> Pango,
> ATK, etc
> 
> Some of these packages need to be configured differently depending upon the
> backend chosen (X, DirectFB, ...) etc
> 
> What do people think is the best way to deal with this?
> Is is a package specific config option So for each of these packages specify
> a backend option?
> Or is it a global switch for all affected packages?
> 
> Cheers
> Dan

Can't you test in the packages/<package>.mk for the appropriate
BR2_<CONFIG> I.E: 
BR2_XORG or BR2_TINYX or whatever the names are?



Best Regards
Ulf Samuelsson
