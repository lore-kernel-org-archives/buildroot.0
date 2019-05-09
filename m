From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 May 2019 10:50:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to 5.0.4
In-Reply-To: <20190509074311.102736-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Thu, 9 May 2019 09:43:11 +0200")
References: <20190509074311.102736-1-titouan.christophe@railnova.eu>
Message-ID: <871s18huzm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > * Redis 5 now supports reproducible builds via SOURCE_DATE_EPOCH
 > * Add myself to DEVELOPERS for Redis

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 > ---
 >  DEVELOPERS                      | 3 +++
 >  package/redis/0001-uclibc.patch | 9 ++++++---

Committed to next, thanks.

It would be great if we could get our patches upstream. Care to take a
look at that?

-- 
Bye, Peter Korsgaard
