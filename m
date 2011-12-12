From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2011 11:17:50 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <4EE5D3BB.7000700@free.fr>
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk>
 <87ty59l5y1.fsf@macbook.be.48ers.dk>
 <CAHUNapRt1=nyUK=o__fUDk2JQVn66F1ikwBF+jarECg9=CESSg@mail.gmail.com>
 <4EE5B9E9.40404@free.fr> <87hb16up5z.fsf@macbook.be.48ers.dk>
 <4EE5D3BB.7000700@free.fr>
Message-ID: <20111212111750.0473fb52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 12 Dec 2011 11:13:15 +0100,
Guillaume Gardet <guillaume.gardet@free.fr> a ?crit :

> If I unset CONFIG_SITE, it seems to work fine. :)
> Could you unset CONFIG_SITE in Buildroot, please?

Peter has already modified Buildroot to unset CONFIG_SITE following
your report:

http://git.buildroot.net/buildroot/commit/?id=12c9f7dd6dee9c6029b4f9a12d6aac1516911ab4

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
