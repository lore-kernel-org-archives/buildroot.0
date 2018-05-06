From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 6 May 2018 12:49:19 -0300
Subject: [Buildroot] [git commit] .gitlab-ci.yml: update after removal
 of freescale defconfigs
In-Reply-To: <20180506153657.50C1F8B803@busybox.osuosl.org>
References: <20180506153657.50C1F8B803@busybox.osuosl.org>
Message-ID: <CAOMZO5BiOhCMnfEDfD4HDO36RP-2Wu=jeynLvBhtrVbVHnmWqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, May 6, 2018 at 12:36 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=e607881f201337198a0bb2d69c5c8507a1ebfde9
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .gitlab-ci.yml | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 568fb7fc19..e80491cdde 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -125,14 +125,11 @@ engicam_imx6qdl_icore_rqs_defconfig: *defconfig
>  engicam_imx6ul_geam_defconfig: *defconfig
>  engicam_imx6ul_isiot_defconfig: *defconfig
>  freescale_imx28evk_defconfig: *defconfig
> -freescale_imx31_3stack_defconfig: *defconfig
>  freescale_imx6dlsabreauto_defconfig: *defconfig
>  freescale_imx6dlsabresd_defconfig: *defconfig
>  freescale_imx6qsabreauto_defconfig: *defconfig
>  freescale_imx6qsabresd_defconfig: *defconfig
> -freescale_imx6sololiteevk_defconfig: *defconfig

Thanks for taking care of this! I missed it.
