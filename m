From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 22:07:06 +0200
Subject: [Buildroot] [Resend V4 2/3] prosody: remove tweaked
 configuration
In-Reply-To: <20180318122808.4291-2-francois.perrad@gadz.org>
References: <20180318122808.4291-1-francois.perrad@gadz.org>
 <20180318122808.4291-2-francois.perrad@gadz.org>
Message-ID: <20180326220706.1f0c138c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Mar 2018 13:28:07 +0100, Francois Perrad wrote:
> upgrading a tweaked configuration is painful,
> so stay with the upstream configuration which is already installed.
> 
> everybody could do its own configuration in its rootfs_overlay.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/prosody/prosody.cfg.lua | 184 ----------------------------------------
>  package/prosody/prosody.mk      |  11 ---
>  2 files changed, 195 deletions(-)
>  delete mode 100644 package/prosody/prosody.cfg.lua

Applied to master after squashing PATCH 2/3 and 3/3, because they
logically belong together.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
