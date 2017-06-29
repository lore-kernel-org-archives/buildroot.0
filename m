From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 29 Jun 2017 18:54:56 +0530
Subject: [Buildroot] [PATCH 1/2] .gitlab-ci.yml: regenerate
In-Reply-To: <20170627183216.31749-1-arnout@mind.be>
References: <20170627183216.31749-1-arnout@mind.be>
Message-ID: <CAMty3ZD82PWjycxAKJqj-XjSY9rcrNRuS+izuKc_KL72Xj8ghA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 28, 2017 at 12:02 AM, Arnout Vandecappelle
(Essensium/Mind) <arnout@mind.be> wrote:
> engicam_imx6ul_isiot_defconfig was added in commit 0235bc6176, but it
> should have been engicam_imx6ul_isiot_mmc_defconfig.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 1f2410e862..38eaf89d19 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -92,7 +92,7 @@ cubieboard2_defconfig: *defconfig
>  engicam_imx6qdl_icore_defconfig: *defconfig
>  engicam_imx6qdl_icore_rqs_defconfig: *defconfig
>  engicam_imx6ul_geam_defconfig: *defconfig
> -engicam_imx6ul_isiot_defconfig: *defconfig
> +engicam_imx6ul_isiot_mmc_defconfig: *defconfig

This shouldn't be _mmc, will fix and send the patch.

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
