From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Dec 2020 10:16:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-12-06
In-Reply-To: <23e2d4ac-27ba-3967-36da-d1ae1ddfa050@inbox.ru>
References: <E1kmBem-00064q-IV.thomas-petazzoni-bootlin-com@mx261.i.mail.ru>
 <23e2d4ac-27ba-3967-36da-d1ae1ddfa050@inbox.ru>
Message-ID: <20201207101650.4aaf5988@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 7 Dec 2020 11:56:24 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> TimescaleDB have no PostgreSQL 13 support right now.
> 
> https://github.com/timescale/timescaledb/blob/master/CMakeLists.txt
> 
> # Ensure that PostgreSQL version is supported and consistent
> # with src/compat.h version check
> if ((${PG_VERSION_MAJOR} LESS "11") OR
>      (${PG_VERSION_MAJOR} GREATER "12"))
>    message(FATAL_ERROR "TimescaleDB only supports PostgreSQL 11 and 12")
> endif()

Then, how do we proceed, since timescaledb requires PostgreSQL, but
Buildroot now uses PostgreSQL 13 ? Should we drop timescaledb ? Under
what time frame does the timescaledb project intends to support
PostgreSQL 13 ? There is apparently a pull request opened at
https://github.com/timescale/timescaledb/pull/2498.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
