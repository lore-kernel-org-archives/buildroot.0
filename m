From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:29:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to v5.0.8
In-Reply-To: <20200316103134.4489-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Mon, 16 Mar 2020 11:31:34 +0100")
References: <20200316103134.4489-1-titouan.christophe@railnova.eu>
Message-ID: <87y2rle8is.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Please explicitly mention when version bumps fixes security issues so
they won't be missed for the stable branches. From the release notes:

================================================================================
Redis 5.0.8     Released Thu Mar 12 16:05:41 CET 2020
================================================================================

Upgrade urgency HIGH: This release fixes security issues.

[FIX] revisit CVE-2015-8080 vulnerability

https://raw.githubusercontent.com/antirez/redis/5.0/00-RELEASENOTES

Committed to 2019.11.x and 2020.02.x after updating the commit message
to mention that it is a security bump, thanks.

-- 
Bye, Peter Korsgaard
