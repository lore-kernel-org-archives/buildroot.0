From: Mark Constable <markc@renta.net>
Date: Sun, 18 Oct 2009 19:50:49 +1000
Subject: [Buildroot] Missing x86_64-linux-uclibc-gcc and
	uClibc-locale-20081111-64-el.tgz
In-Reply-To: <20091018092046.GG3498@mx.loc>
References: <4ADAC70C.1060601@renta.net> <20091018092046.GG3498@mx.loc>
Message-ID: <4ADAE4F9.6040008@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Reutner-Fischer wrote:
>> --2009-10-18 17:37:31--  http://www.uclibc.org/downloads/uClibc-locale-20081111-64-el.tgz
>> HTTP request sent, awaiting response... 404 Not Found
>
> http://lists.uclibc.org/pipermail/uclibc/2008-December/041624.html

Thanks for the hint but the only thing I could pick up from that thread
was to unset BR2_ENABLE_LOCALE_PREGENERATED however I still get the same
error. Even if I do a make clean and comment out all 4 references to
LOCALE it still tries to download uClibc-locale-20081111-64-el.tgz!

This one is a problem too. There is no staging_dir/usr/bin dir let
alone a x86_64-linux-uclibc-gcc command...

>> buildroot-2009.08/build_x86_64/staging_dir/usr/bin/x86_64-linux-uclibc-gcc: Command not found

Am I wasting my time trying to build an x86_64 target or toolchain?

--markc
