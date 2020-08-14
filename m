From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Aug 2020 23:19:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to version 6.0.6
In-Reply-To: <20200813225726.70759-1-titouan.christophe@railnova.eu>
References: <20200813225726.70759-1-titouan.christophe@railnova.eu>
Message-ID: <20200814231937.1b10f56c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Aug 2020 00:57:26 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> From the release notes:
> 
> ================================================================================
> Redis 6.0.6     Released Mon Jul 20 09:31:30 IDT 2020
> ================================================================================
> 
> Upgrade urgency MODERATE: several bugs with moderate impact are fixed here.
> 
> The most important issues are listed here:
> 
> * Fix crash when enabling CLIENT TRACKING with prefix
> * EXEC always fails with EXECABORT and multi-state is cleared
> * RESTORE ABSTTL won't store expired keys into the db
> * redis-cli better handling of non-pritable key names
> * TLS: Ignore client cert when tls-auth-clients off
> * Tracking: fix invalidation message on flush
> * Notify systemd on Sentinel startup
> * Fix crash on a misuse of STRALGO
> * Few fixes in module API
> * Fix a few rare leaks (STRALGO error misuse, Sentinel)
> * Fix a possible invalid access in defrag of scripts (unlikely to cause real harm)
> 
> New features:
> 
> * LPOS command to search in a list
> * Use user+pass for MIGRATE in redis-cli and redis-benchmark in cluster mode
> * redis-cli support TLS for --pipe, --rdb and --replica options
> * TLS: Session caching configuration support
> ================================================================================
> 
> Also, the reference hashes repo has moved to redis/redis-hashes
> probably because the original maintainer has stepped down, see
> http://antirez.com/news/133
> 
> Finally, the copyright year in the COPYING file has been updated,
> and so does its sha256 checksum.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/redis/redis.hash | 6 +++---
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
