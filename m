From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 10:41:26 +0100
Subject: [Buildroot] [PATCH] canfestival: comment on musl disable
In-Reply-To: <dae10b62748408881f5c3dbe970d8bf428089e71.1479370709.git.baruch@tkos.co.il>
References: <dae10b62748408881f5c3dbe970d8bf428089e71.1479370709.git.baruch@tkos.co.il>
Message-ID: <20161122104126.41435560@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 10:18:29 +0200, Baruch Siach wrote:
> Based on commit 4d00a4058b9e5 (can-festival: disable on musl) and a previous
> fix attempt[1], add a comment explaining why build with musl is disabled.
> 
> [1] http://patchwork.ozlabs.org/patch/509731/
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/canfestival/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
