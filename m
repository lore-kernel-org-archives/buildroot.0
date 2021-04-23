From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:12:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to v6.2.2
In-Reply-To: <20210423114603.198731-1-titouanchristophe@gmail.com>
References: <20210423114603.198731-1-titouanchristophe@gmail.com>
Message-ID: <20210423231203.60c4fc64@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 23 Apr 2021 13:46:03 +0200
Titouan Christophe <titouanchristophe@gmail.com> wrote:

> From the release notes:
> ================================================================================
> Redis 6.2.2 Released Mon April 19 19:00:00 IST 2021
> ================================================================================
> 
> Upgrade urgency: HIGH, if you're using ACL and pub/sub, CONFIG REWRITE, or
> suffering from performance regression.
> 
> See https://github.com/redis/redis/blob/6.2.2/00-RELEASENOTES
> 
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
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
