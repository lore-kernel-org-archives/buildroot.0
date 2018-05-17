From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 22:22:28 +0200
Subject: [Buildroot] [PATCH 1/1] libkcapi: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20180515184138.21923-1-fontaine.fabrice@gmail.com>
References: <20180515184138.21923-1-fontaine.fabrice@gmail.com>
Message-ID: <20180517222228.2f666ad2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 May 2018 20:41:38 +0200, Fabrice Fontaine wrote:
> Since commit
> https://github.com/smuellerDD/libkcapi/commit/4d0a5c235536b5f679e6a9b0c847f56c9cfc3835,
> libkcapi uses __sync_add_and_fetch_4 and __sync_sub_and_fetch_4
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/de5e136ea433633d836bff1d2ac1d3b461391b83
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libkcapi/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
