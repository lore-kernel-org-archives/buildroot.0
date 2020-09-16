From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Sep 2020 15:10:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to 6.0.8
In-Reply-To: <20200915210910.GC2422@scaer> (Yann E. MORIN's message of "Tue,
 15 Sep 2020 23:09:10 +0200")
References: <20200915194929.15323-1-titouan.christophe@railnova.eu>
 <20200915210910.GC2422@scaer>
Message-ID: <875z8drhnh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Titouan, All,
 > On 2020-09-15 21:49 +0200, Titouan Christophe spake thusly:
 >> From the release notes
 >> See: https://github.com/redis/redis/blob/6.0.8/00-RELEASENOTES
 >> 
 >> ================================================================================
 >> Redis 6.0.7     Released Fri Aug 28 11:05:09 IDT 2020
 >> ================================================================================
 >> 
 >> Upgrade urgency MODERATE: several bugs with moderate impact are fixed,
 >> Specifically the first two listed below which cause protocol errors for clients.
 >> 
 >> ================================================================================
 >> Redis 6.0.8     Released Wed Sep 09 23:34:17 IDT 2020
 >> ================================================================================
 >> 
 >> Upgrade urgency HIGH: Anyone who's using Redis 6.0.7 with Sentinel or
 >> CONFIG REWRITE command is affected and should upgrade ASAP, see #7760.
 >> 
 >> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

 > Applied to master. Since it was a security bump, I changed the commit
 > title accordingly.

Where do you see that it is a security bump? I don't seem to find any
security related fixes in 6.0.7 / 6.0.8.

-- 
Bye, Peter Korsgaard
