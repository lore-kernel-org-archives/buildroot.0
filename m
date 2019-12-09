From: Ben Edwards <ben@artfuldodge.io>
Date: Mon, 09 Dec 2019 11:43:05 +0000
Subject: [Buildroot] Errors when compiling uboot for rpi 3
In-Reply-To: <CAL=Sv2LNuRsfd8jVfEOdsMCKjFrWH024dhtgdK=wy-ByXPH9jQ@mail.gmail.com>
References: <1575547814.xk698xjfax.astroid@greyskull.none>
 <20191205213607.58c3e098@windsurf>
 <CAL=Sv2LNuRsfd8jVfEOdsMCKjFrWH024dhtgdK=wy-ByXPH9jQ@mail.gmail.com>
Message-ID: <1575891626.557bzrxhyy.astroid@greyskull.none>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Excerpts from Arthur COURTEL's message of December 9, 2019 11:39 am:
> Hello,
> There is a defconfig for uboot rpi3 32b.
> Use this to get it:
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_3_32b"
> It builds a "uboot.bin" but I didn't tested it.
> 
> Best regards,
> Arthur
> 

Hi Arthur,

I must apologise, I accidentally replied only to Thomas in my last mail.
I have used the 32b config for pi 3 and can confirm it works (it boots).
There is some weirdness with the hdmi display but it's my understanding
that that's a uboot problem so I won't bother this list with it.

Best,
Ben
