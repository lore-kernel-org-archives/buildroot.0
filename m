From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 19:37:36 +0200
Subject: [Buildroot] [PATCH] package/18xx-ti-utils: use short version
 string
In-Reply-To: <450c6a5e75a1f9769671e4b32c9e041120867db3.1602678577.git.baruch@tkos.co.il>
References: <450c6a5e75a1f9769671e4b32c9e041120867db3.1602678577.git.baruch@tkos.co.il>
Message-ID: <20201014193736.2d3386f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Oct 2020 15:29:37 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> This is compatible with release-monitoring.org, so it allows easier
> tracking of update status.
> 
> There appears to be no easy way to use anything other than tag/commit
> for _VERSION with the git download method. git.ti.com offers snapshot
> download over https, so use use that instead. As added bonus, the https
> download method is more firewall friendly.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/18xx-ti-utils/18xx-ti-utils.hash | 2 +-
>  package/18xx-ti-utils/18xx-ti-utils.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
