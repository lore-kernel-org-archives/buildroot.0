From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Sep 2020 15:38:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to 6.0.8
In-Reply-To: <20200915194929.15323-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Tue, 15 Sep 2020 21:49:29 +0200")
References: <20200915194929.15323-1-titouan.christophe@railnova.eu>
Message-ID: <87wo0iyo1p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > From the release notes
 > See: https://github.com/redis/redis/blob/6.0.8/00-RELEASENOTES

 > ================================================================================
 > Redis 6.0.7     Released Fri Aug 28 11:05:09 IDT 2020
 > ================================================================================

 > Upgrade urgency MODERATE: several bugs with moderate impact are fixed,
 > Specifically the first two listed below which cause protocol errors for clients.

 > ================================================================================
 > Redis 6.0.8     Released Wed Sep 09 23:34:17 IDT 2020
 > ================================================================================

 > Upgrade urgency HIGH: Anyone who's using Redis 6.0.7 with Sentinel or
 > CONFIG REWRITE command is affected and should upgrade ASAP, see #7760.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
