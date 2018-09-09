From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:01:13 +0200
Subject: [Buildroot] [PATCH] Config.in.legacy: fix typo in config option
In-Reply-To: <20180909013950.14184-1-david@lechnology.com>
References: <20180909013950.14184-1-david@lechnology.com>
Message-ID: <20180909150113.1a6e0a89@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Sep 2018 20:39:50 -0500, David Lechner wrote:
> The commit message of a2d44ec6bf12 ("linux-headers: drop old unsupported
> 4.{10,11,12,13,15} versions") says, "select an older kernel headers
> (4.9)". However a couple lines are selecting 4.19.
> 
> Change BR2_KERNEL_HEADERS_4_19 to BR2_KERNEL_HEADERS_4_9 as intended.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  Config.in.legacy | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
