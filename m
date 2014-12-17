From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 17 Dec 2014 16:53:33 +0100 (CET)
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <1418831416.4132.19.camel@synopsys.com>
Message-ID: <412765297.29393617.1418831613614.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> Right it was too obvious.
> 
> So looks like this is a replacement for my patch:
> --->---
> BR2_TARGET_GENERIC_GETTY_PORT=console
> BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP=y
> --->---
> 

Doesn't your patch allow multiple getty ? I don't think console
 does that...

that was a feature I was interested in.


> Then the question is why this is not a default in Buildroot?
> IMHO most of the time kernel's bootcmd has console set so explicit
> setup
> of tty in Buildroot might be required in some corner cases only.
> 
> -Alexey
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
