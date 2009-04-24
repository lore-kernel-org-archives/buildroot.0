From: =?gb2312?B?sMu95LjnuOf=?= <l0op8ack@hotmail.com>
Date: Fri, 24 Apr 2009 17:07:07 +0000
Subject: [Buildroot] this may be a bug in busybox
In-Reply-To: <4B27817CD25E4E418A227BED51393574@apexjs>
References: <4B27817CD25E4E418A227BED51393574@apexjs>
Message-ID: <BLU139-W2910E8768336396EA17148DD720@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


route -n
-n Don't resolve names

 
> From: sagaert.johan at skynet.be
> To: buildroot at busybox.net
> Date: Fri, 24 Apr 2009 19:03:23 +0200
> Subject: [Buildroot] this may be a bug in busybox
> 
> hi
> 
> in busybox 1.14.0
> 
> # route
> Kernel IP routing table
> Destination Gateway Genmask Flags Metric Ref Use
> Iface
> 192.168.1.0 * 255.255.255.0 U 0 0 0 eth0
> 127.0.0.0 * 255.0.0.0 U 0 0 0 lo
> default 1.1.168.192.in- 0.0.0.0 UG 0 0 0 eth0
> #
> 
> 
> 1.1.168.192 should be 192.168.1.1
> 
> Anyone else noticed this ?
> Johan
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

_________________________________________________________________
?Windows Live ??????????Messenger?
http://im.live.cn/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090424/64995c91/attachment.htm>
