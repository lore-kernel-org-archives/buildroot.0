From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 26 Sep 2007 10:56:01 +0200
Subject: [Buildroot] Buildroot for at91rm9200df
In-Reply-To: <406A31B117F2734987636D6CCC93EE3C023DCAF3@ehost011-3.exch011.intermedia.net>
References: <20070925220441.CE64FA681D@busybox.net>
	<1190759987.19731.105.camel@elrond.atmel.sweden>
	<406A31B117F2734987636D6CCC93EE3C023DCAF3@ehost011-3.exch011.intermedia.net>
Message-ID: <1190796961.4933.11.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-09-25 klockan 16:53 -0700 skrev Leonid:
> Hi, Ulf:
> 
> Your buildroot from at91 site is working nice, but I couldn't build for
> this target when I checked out yesterday daily snapshot. I tried to use
> your at91rm9200df.config as a reference, had to add some defines (like
> BR2_STRIP_strip) but looks like it still lacks something (I have
> attached it) - builds stops without visible failures yet filesystem is
> not completely built. For example, there are no all these system
> utilites (like ls, rm, cd, etc... Which are actually busybox applets).
> Busybox executable gets created but is not copied into root
> filesystem... Some misconfiguration I guess.
> 
> Do you have config file for this target which will work with latest
> buildroot or config file is not enough and some additional "massaging"
> is required (you run project/config/conf for example in your buildroot)?
> Or this target is not supported by simple way by latest buildroot?
> 

It was some time since I looked at the AT91RM9200DF board,
so things might have happened.
I will see If I cen get time to retest.


> Thanks,
> 
> Leonid.
> 
