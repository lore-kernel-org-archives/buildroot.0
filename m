From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 13:34:56 +0200
Subject: [Buildroot] [PATCH 1/1] boost: chrono needs system
In-Reply-To: <20180701095913.4405-1-fontaine.fabrice@gmail.com>
References: <20180701095913.4405-1-fontaine.fabrice@gmail.com>
Message-ID: <20180701133456.606fbe61@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Jul 2018 11:59:13 +0200, Fabrice Fontaine wrote:
> output/host/usr/bin/mips-linux-gnu-readelf -d
> output/staging/usr/lib/libboost_chrono.so
> 
> Dynamic section at offset 0x2c0 contains 30 entries:
>   Tag        Type                         Name/Value
>  0x0000000000000001 (NEEDED)             Shared library:
> [libboost_system.so.1.67.0]

One nit: when copy/pasting commands, it's better to not wrap long
lines. Of course, for regular text, it should be wrapped at 72
characters, but not when copy/pasting the output of commands, as it
makes the whole thing not very readable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
