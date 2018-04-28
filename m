From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 17:50:17 +0200
Subject: [Buildroot] [V4 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <20180328083827.31540-2-francois.perrad@gadz.org>
References: <20180328083827.31540-1-francois.perrad@gadz.org>
 <20180328083827.31540-2-francois.perrad@gadz.org>
Message-ID: <20180428175017.716f51a9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Mar 2018 10:38:27 +0200, Francois Perrad wrote:
> DROPBEAR_SMALL_CODE could be only honored with bundled libtomcrypt
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/dropbear/Config.in   | 1 +
>  package/dropbear/dropbear.mk | 5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks. The fact that it's only done with static
libraries (libtommath and libtomcrypt are only compiled as static
libraries) and only for the !small case make this pretty "specific",
but OK.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
