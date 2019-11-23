From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 21:36:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to version 5.0.7
In-Reply-To: <20191123200142.29254-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Sat, 23 Nov 2019 21:01:42 +0100")
References: <20191123200142.29254-1-titouan.christophe@railnova.eu>
Message-ID: <87wobqwcsq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Changes announced upstream:
 > Upgrade urgency HIGH: many issues fixed, some may have an impact.
 > Redis 5.0.7 fixes a number of bugs, none is very critical, however
 > there are a few that may have an impact. It's a good idea to upgrade.
 > There are fixes in the area of replication from modules commands and
 > callbacks, AOF fsync (non critical issue), memory leaks (very rare and small),
 > streams beahvior (non critical), and a potential crash in commands
 > processing multiple keys at the same time that is there for years, and happens
 > very rarely, but is not impossible to trigger.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
