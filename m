From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 17 Nov 2019 10:24:34 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/ltp-testsuite: proper fix
 for missing __kernel_fsid_t
In-Reply-To: <20191116094220.GC32494@scaer>
References: <20191116003638.7666-1-petr.vorel@gmail.com>
 <20191116094220.GC32494@scaer>
Message-ID: <20191117092434.GA22986@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> [--SNIP--]
> > [1] https://patchwork.ozlabs.org/patch/1195915/

> I've added this URL to the description of patch 7, and applied to
> master, thanks.
Thanks! I'll probably merge patch [1] in LTP on Monday (already Acked by Jan
Stancek, pretty obvious, but I'll prefer to wait Cyril Hrubis ack).

Not sure if it's worth then add commit hash in buildroot patch and renumber
patches (0005 was already taken by static linking fix), I guess these are minor
and not needed to be done. Anyway, these are 3 are backports thus temporary.

Kind regards,
Petr
