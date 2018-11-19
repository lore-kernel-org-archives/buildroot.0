From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:39:41 +0100
Subject: [Buildroot] [PATCH v4] libnftnl: drop useless
 BR2_PACKAGE_LIBNFTNL_XML
In-Reply-To: <316a06e0166e9f1294cefb7c6a07af79bb1d60bf.1542350443.git.baruch@tkos.co.il>
References: <316a06e0166e9f1294cefb7c6a07af79bb1d60bf.1542350443.git.baruch@tkos.co.il>
Message-ID: <20181119223941.336f80b5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Nov 2018 08:40:43 +0200, Baruch Siach wrote:
> Commit fa0d1ebff99 (libnftnl: bump to version 1.0.9) removed the mxml
> dependency. Remove the redundant BR2_PACKAGE_LIBNFTNL_XML config symbol
> as well.
> 
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v4: Add missing 'bool' type to the legacy entry

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
