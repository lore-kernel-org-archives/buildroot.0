From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 21:17:03 +0200
Subject: [Buildroot] [PATCH 1/2] python-mimeparse: new package
In-Reply-To: <20180828101618.4746-1-grzegorz@blach.pl>
References: <20180828101618.4746-1-grzegorz@blach.pl>
Message-ID: <20180829211703.46279726@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 12:16:17 +0200, Grzegorz Blach wrote:
> This module provides basic functions for parsing mime-type names
> and matching them against a list of media-ranges.
> 
> https://github.com/dbtsai/python-mimeparse
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

Thanks for this contribution, I've applied to next with a minor fix
(see below). And thanks Yegor for your review!


> +N:	Grzegorz Blach <grzegorz@blach.pl>
> +F:	package/python-mimeparse

There should have been a final / in package/python-mimeparse/ in the
DEVELOPERS file. As I said, I fixed that when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
