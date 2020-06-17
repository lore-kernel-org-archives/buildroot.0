From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 21:09:35 +0200
Subject: [Buildroot] [PATCH v2 00/17] OLPC XO updates
In-Reply-To: <20200617104925.1036330-1-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
Message-ID: <20200617210935.30c5b508@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jun 2020 12:49:08 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> please consider applying this patch set. The ultimate goal is to enable
> jffs2 images for the XO-1. While I that, I noticed that while tidying up
> the kernel configuration, I messed up a bit and some config symbols
> ended up disabled.
> 
> Since this was first posted, a 5.7 kernel was release. I've tested that
> 5.7.1 works well on both XO-1.75 (arm) and XO-1 (x86), so I've added two
> patches that bump the kernel version too.

I've applied the entire series, with very small changes. I'll reply to
the individual patches I tweaked, but everything is applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
