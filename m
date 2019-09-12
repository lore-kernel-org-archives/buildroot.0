From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Sep 2019 19:10:05 +0200
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: extract current
 commit id, not master
In-Reply-To: <87o908bfae.fsf@tarshish>
References: <20190829072233.29988-1-thomas.petazzoni@bootlin.com>
 <87o908bfae.fsf@tarshish>
Message-ID: <20190912191005.5b49bc3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Aug 2019 10:29:29 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Unrelated to this patch, commit id retrieval can be simplified to just:
> 
>   git rev-parse HEAD

Good point, I sent a follow-up patch doing exactly this. Thanks for the
suggestion!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
