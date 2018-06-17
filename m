From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:02:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix musl build error
In-Reply-To: <20180616213918.29484-1-bernd.kuhls@t-online.de>
References: <20180616213918.29484-1-bernd.kuhls@t-online.de>
Message-ID: <20180617140207.19c6d947@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jun 2018 23:39:18 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/ccd/ccd07150e459b2b2caba6e561ecc6eae60c83ef5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/0003-musl-time-h.patch | 33 +++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/mesa3d/0003-musl-time-h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
