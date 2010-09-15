From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Wed, 15 Sep 2010 20:36:30 +0200
Subject: [Buildroot] make lzo not find utime.h
In-Reply-To: <AANLkTikwGZ5sB6p873bDt8m-UVaAikMJjQ3U=5N-h2GF@mail.gmail.com>
References: <AANLkTikwGZ5sB6p873bDt8m-UVaAikMJjQ3U=5N-h2GF@mail.gmail.com>
Message-ID: <4C91122E.60400@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 14.09.2010 12:18, schrieb icemanpro:
> Hi, everyone
>
>   I "make i686_defconfig" in buildroot directory.and when make lzotest
> has an error:"error: utime.h: No such file or directory"
>
> how to fix this bug?
>
Hi,
try to run "make flush;make"
maybe there are some misconfigured values if you use the configuration 
cache.
The usual order of commands is
make i686_defconfig
make
Did you launch make lzo right after make i686_... ?
What version of buildroot do you run - 2010.08?

Regards,
Marcus
