From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 10:26:47 +0100
Subject: [Buildroot] [PATCH] redis: bump to version 2.6.17
In-Reply-To: <1387721737.8692.0.camel@phoenix>
References: <1387721737.8692.0.camel@phoenix>
Message-ID: <20131225102647.4610d633@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Sun, 22 Dec 2013 22:15:37 +0800, Axel Lin wrote:
> Fixes since 2.6.16:
> * [FIX] redis-cli: fix big keys search when the key no longer exist.
> * [FIX] Allow AUTH / PING when disconnected from slave with serve-stale-data on.
> * [FIX] redis-benchmark: update help for new __rand_int__ form.
> * [FIX] Fix broken rdbWriteRaw() return value check in rdb.c (harmless).
> * [FIX] Log to what master a slave is going to connect to.
> * [FIX] Only run the fast active expire cycle if master & enabled.
> * [FIX] Fixed a replication bug involving 32 bit instances and big datasets
>         hard to compress that resulted into more than 2GB of RDB file sent.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  package/redis/redis.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
