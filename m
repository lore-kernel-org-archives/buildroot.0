From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 22:53:47 +0200
Subject: [Buildroot] [PATCH v2 1/2] sunxi-mali-mainline: add hash file
 for tarball
In-Reply-To: <20180825135211.123743-1-giulio.benetti@micronovasrl.com>
References: <20180825135211.123743-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180906225347.532165ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 15:52:10 +0200, Giulio Benetti wrote:
> sunxi-mali-mainline package has not hash file.
> 
> Add hash file with sha256sum for tarball resulting from git download.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/sunxi-mali-mainline/sunxi-mali-mainline.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.hash

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
