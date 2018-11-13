From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 21:21:49 +0100
Subject: [Buildroot] [PATCH] libnftnl: drop useless
 BR2_PACKAGE_LIBNFTNL_XML
In-Reply-To: <d8767e3da1e02d6a5f1770bf490028b1bab13e46.1542139148.git.baruch@tkos.co.il>
References: <d8767e3da1e02d6a5f1770bf490028b1bab13e46.1542139148.git.baruch@tkos.co.il>
Message-ID: <20181113212149.255fb576@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Nov 2018 21:59:08 +0200, Baruch Siach wrote:
> Commit fa0d1ebff99 (libnftnl: bump to version 1.0.9) removed the mxml
> dependency. Remove the redundant BR2_PACKAGE_LIBNFTNL_XML config symbol
> as well.
> 
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Do we need Config.in.legacy handling ?

We normally add Config.in.legacy handling when removing options, but on
the other hand, this option has had no effect since 2018.02.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
