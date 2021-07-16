From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:25:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/gcnano-binaries: bump to
 version 6.4.3
In-Reply-To: <BwTIMG2dlIPHQ8gnD4pEBqu_ZFaAB68eIBIQSL4hBxIKiOBYIy0ZulAnqlLsgHU6CI6a5n2-7gh08GtoLNHmobnYlDbSbmm0ixqkAT33FdA=@protonmail.com>
References: <BwTIMG2dlIPHQ8gnD4pEBqu_ZFaAB68eIBIQSL4hBxIKiOBYIy0ZulAnqlLsgHU6CI6a5n2-7gh08GtoLNHmobnYlDbSbmm0ixqkAT33FdA=@protonmail.com>
Message-ID: <20210716232556.5114f9ac@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Patrick,

On Tue, 13 Jul 2021 08:29:59 +0000
"Patrick G. via buildroot" <buildroot@busybox.net> wrote:

> https://github.com/STMicroelectronics/gcnano-binaries/
> 
> Signed-off-by: Patrick Gerber <p.gerber@iemgroup.com>

Thanks a lot for this contribution. However, about two weeks before
your patch, my colleague K?ry Maincent had already sent the same update
and it has already been applied on June 28.

However, your change and K?ry's are slightly different. K?ry had to
split up the following variables:

+GCNANO_BINARIES_LIB_VERSION = 6.4
+GCNANO_BINARIES_LIB_REVISION = 3

Could you test commit 59db11c7c445ef8662163a80997aa71f760a0359 and see
if it works for you ?

Thanks a lot,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
