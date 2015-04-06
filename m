From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:34:17 +0200
Subject: [Buildroot] [PATCH] Makefile: add help for
 linux-update-defconfig target
In-Reply-To: <55229762.4040302@mind.be>
References: <1428003286-13449-1-git-send-email-yegorslists@googlemail.com>
 <5522871B.2050603@mind.be>
 <20150406151856.17c47bc3@free-electrons.com>
 <55229762.4040302@mind.be>
Message-ID: <20150406233417.68ba7a8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, 06 Apr 2015 16:25:38 +0200, Arnout Vandecappelle wrote:

>  Here are the reasons:
> 
> - update-defconfig doesn't exist for all kconfig packages
> 
> - update-defconfig is preferred if it exists (for Linux I certainly see no
> reason to ever use update-config)
> 
> - documenting foo-update-defconfig would perhaps be better, but that's part of a
> bigger change that would completely remove all the specifics. When I did the
> 'make help' patches I started on that, but it turns out to be a bit more work so
> I dropped it in the end.

Hm, well, I'm still not highly convinced on how we handle this
per-package target help text. But anyway, applied, as it isn't that
worse than what we have today.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
