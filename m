From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Aug 2016 06:45:34 +0200
Subject: [Buildroot] [PATCH] package/libfreeimage: fix C++11 compliance
	with	gcc-6
References: <1472422054-6058-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <e8rc9dx4ld.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 29 Aug 2016 00:07:34 +0200 schrieb Yann E. MORIN:

> Like in cbe01f6, 38249d5, 97fe953, fix C++11 compliance regarding
> narrowing types.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/081/0811531872f69f9febbdc482dfbdd7fb5c35d1c8/
>     http://autobuild.buildroot.org/results/90c/90c9cb4ffe705b8c91f4fb602e33e2ba9bcdee77/
>     and a few others...

Hi Yann,

one hour ago I sent a different patch, but yours fixes the root cause so I
marked my patch as superseded: http://patchwork.ozlabs.org/patch/663442/

Please send your patch upstream, an open bug tracker entry already exists:
https://sourceforge.net/p/freeimage/bugs/267/

Regards, Bernd
