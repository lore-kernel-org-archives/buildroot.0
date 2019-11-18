From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 21:25:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to 5.0.6
In-Reply-To: <20191118152216.42274-1-titouan.christophe@railnova.eu>
References: <20191118152216.42274-1-titouan.christophe@railnova.eu>
Message-ID: <20191118212503.68cbb05d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Nov 2019 16:22:16 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I looked at the release notes and they say it fixes a critical bug, and
it has only a few commits, so I applied this to master.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
