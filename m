From: bifferos <bifferos@yahoo.co.uk>
Date: Thu, 1 Mar 2012 11:13:30 +0000 (GMT)
Subject: [Buildroot] Kernel and buildroot in 1MB
In-Reply-To: <20120301085010.1cec8907@skate>
References: <4F4EC83C.7090208@yahoo.co.uk> <20120301085010.1cec8907@skate>
Message-ID: <1330600410.23056.YahooMailNeo@web132105.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Original Message -----
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: buildroot at busybox.net
> Cc: 
> Sent: Thursday, 1 March 2012, 7:50
> Subject: Re: [Buildroot] Kernel and buildroot in 1MB
> 
> Hello,
> 
> Le Thu, 01 Mar 2012 00:52:12 +0000,
> bifferos <bifferos@yahoo.co.uk> a ?crit :
> 
>>  So far I have been using buildroot only to extract the busybox binary 
>>  and use it with my own hand-crafted rootfs, because pretty much any 
>>  binaries other than busybox put me over the limit.? It would be nice
>>  to use the buildroot filesystem as generated, so my question is
>>  this:? If I build a busybox statically linked to uclibc, how can I
>>  remove *all* the other binaries, e.g. uclibc .so?? Or does the build
>>  system not support that?
> 
> Normally BR2_PREFER_STATIC_LIB=y should give you a system with no
> shared libraries, and everything linked statically. However, it is not
> widely, so there might be issues, but we might be interested in fixing
> them.

Thanks, I will play with that and report back.

> That said, it's probably quite difficult these days to build a system
> for which the kernel+root filesystem fits within 1 MB, as your e-mail
> topic seems to suggest.

I wouldn't say it's difficult.? I'm using such a system right now to do 
something useful and, it's actually about 800K (kernel + initrd) system.? 
I wrote up some notes here: 
https://sites.google.com/site/bifferboard/Home/boards-with-1mb-flash/buildroot
regards,
Biff.
