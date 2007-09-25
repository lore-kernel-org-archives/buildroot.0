From: Leonid <Leonid@a-k-a.net>
Date: Tue, 25 Sep 2007 16:53:18 -0700
Subject: [Buildroot] Buildroot for at91rm9200df
In-Reply-To: <1190759987.19731.105.camel@elrond.atmel.sweden>
References: <20070925220441.CE64FA681D@busybox.net>
	<1190759987.19731.105.camel@elrond.atmel.sweden>
Message-ID: <406A31B117F2734987636D6CCC93EE3C023DCAF3@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Ulf:

Your buildroot from at91 site is working nice, but I couldn't build for
this target when I checked out yesterday daily snapshot. I tried to use
your at91rm9200df.config as a reference, had to add some defines (like
BR2_STRIP_strip) but looks like it still lacks something (I have
attached it) - builds stops without visible failures yet filesystem is
not completely built. For example, there are no all these system
utilites (like ls, rm, cd, etc... Which are actually busybox applets).
Busybox executable gets created but is not copied into root
filesystem... Some misconfiguration I guess.

Do you have config file for this target which will work with latest
buildroot or config file is not enough and some additional "massaging"
is required (you run project/config/conf for example in your buildroot)?
Or this target is not supported by simple way by latest buildroot?

Thanks,

Leonid.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: at91rm9200df.config
Type: application/octet-stream
Size: 17318 bytes
Desc: at91rm9200df.config
Url : http://busybox.net/lists/buildroot/attachments/20070925/6d2b2a90/attachment.obj 
