From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 05 Oct 2015 06:25:17 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libpjsip: new package
References: <1430078330-14821-1-git-send-email-bernd.kuhls@t-online.de>
 <5611737F.3050109@lucaceresoli.net>
Message-ID: <dma9ecxik1.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

Am Sun, 04 Oct 2015 20:44:15 +0200 schrieb Luca Ceresoli:

> Dear Bernd,
> 
> are you still interested in this work?

no, I explained my reasons here (in short: I switched to Freeswitch):
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/124777/focus=125692

> Incidentally, since you sent this patch alone and I didn't see v1, I
> applied this one only, and of course it didn't build because libgsm is
> not in Buildroot.

This patch is part of a series to implement an Asterisk package:

libgsm: http://patchwork.ozlabs.org/patch/464719/
libspandsp: http://patchwork.ozlabs.org/patch/464716/
Asterisk (RFC version): http://patchwork.ozlabs.org/patch/464714/

Regards, Bernd
