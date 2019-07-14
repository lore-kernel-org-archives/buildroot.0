From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 13:38:34 +0200
Subject: [Buildroot] [PATCH] package/redis: bump version to 5.0.5
In-Reply-To: <20190714110431.27244-1-peter@korsgaard.com>
References: <20190714110431.27244-1-peter@korsgaard.com>
Message-ID: <20190714133834.30619d14@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jul 2019 13:04:30 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> From the release notes:
> https://raw.githubusercontent.com/antirez/redis/5.0/00-RELEASENOTES
> 
> ================================================================================
> Redis 5.0.5     Released Wed May 15 17:57:41 CEST 2019
> ================================================================================
> 
> Upgrade urgency CRITICAL: This release fixes an important AOF fysnc bug
>                           and other less critical issues.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
