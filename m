From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 16 Mar 2010 21:26:25 +0100
Subject: [Buildroot] Bump cairo version
In-Reply-To: <20100316175039.GE10082@codepoet.org>
References: <20100316175039.GE10082@codepoet.org>
Message-ID: <1268771185.5202.19.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mardi 16 mars 2010 ? 11:50 -0600, Erik Andersen a ?crit :
> -Erik
> 
> --
> Erik B. Andersen             http://codepoet-consulting.com/
> --This message was written using 73% post-consumer electrons--
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Hi Erik,

it seems you dropped the directfb patch for cairo. Are you aware of its
behavior ?
It seems to try to flush the accelerator queue when releasing a cairo
surface. Maybe it's important for people using a 2D blitter as
accelerator (I personally haven't tested this patch...).

Could you consider a previous patch :
http://lists.busybox.net/pipermail/buildroot/2010-February/031888.html

It used to bump to cairo 1.8.8 and also updated this patch for cairo
1.8.

Regards,

-- 
Lionel Landwerlin
