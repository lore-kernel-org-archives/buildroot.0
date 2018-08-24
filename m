From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:50:07 +0200
Subject: [Buildroot] [PATCH] rauc: add patch to make it build with Linux
 < 3.0
In-Reply-To: <20180824123517.25634-1-thomas.petazzoni@bootlin.com>
References: <20180824123517.25634-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180824235007.1bef50b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 14:35:17 +0200, Thomas Petazzoni wrote:
> This commit adds a patch to RAUC that makes the eMMC boot partition
> support optional. This allows RAUC to build successfully on systems
> using Linux < 3.0.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/7e1cbeb458cb6536a36eae0d24cefb36edb22f55/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...make-eMMC-boot-partition-support-optional.patch | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 package/rauc/0002-build-make-eMMC-boot-partition-support-optional.patch

Applied to master after adding the missing AUTORECONF = YES spotted by
Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
