From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 9 Sep 2010 15:27:02 +0200
Subject: [Buildroot] [PATCH] enable terminal type configuration for
	inittab
In-Reply-To: <AANLkTikT3ePxWGquiKyncrRqs9QsifkHv9vTfe_j8=2x@mail.gmail.com>
References: <AANLkTikT3ePxWGquiKyncrRqs9QsifkHv9vTfe_j8=2x@mail.gmail.com>
Message-ID: <AANLkTik1=+wm_g2X-H2F93Q88Nxnao9gVG2R7=q7=nY_@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I've made a patch to be able to configure terminal type for inittab
> along with baudrate and tty* device. What about making tty device
> definition just a string? There some more device names like ttyATx for
> Atmel etc.?

The easiest way were just to add custom entry as for erase size of JFFS2 image.

Yegor
