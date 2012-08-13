From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Aug 2012 19:35:50 +0200
Subject: [Buildroot] [PATCH 14/20] portmap: mention that rpcbind is the
 project that superseds portmap
In-Reply-To: <201208121755.19505.yann.morin.1998@free.fr>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <aae61f5152331e0d8e63c01ddca703e00cde1382.1344706801.git.thomas.petazzoni@free-electrons.com>
 <201208121755.19505.yann.morin.1998@free.fr>
Message-ID: <20120813193550.289adb91@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Aug 2012 17:55:19 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> > +	  Note that portmap is being deprecated in favour of rpcbind.
> 
> Wouldn't it be better to add (thus answering your question from 00/20):
>   depends on BR2_DEPRECATED

Yeah, I wasn't sure about this one. Maybe we should mark it deprecated
yes. Gustavo, do you see any use case that requires keeping portmap if
rpcbind is available?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
