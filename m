From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 15:34:41 +0100
Subject: [Buildroot] [PATCH next] nexbox_a95x_defconfig: bump kernel to
 final 4.10
In-Reply-To: <20170221133446.22019-1-peter@korsgaard.com>
References: <20170221133446.22019-1-peter@korsgaard.com>
Message-ID: <20170221153441.6f85e157@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 14:34:46 +0100, Peter Korsgaard wrote:
> And use same version for header headers as well.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/nexbox_a95x_defconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
> index 906a22b0f..b9328f83b 100644
> --- a/configs/nexbox_a95x_defconfig
> +++ b/configs/nexbox_a95x_defconfig
> @@ -1,13 +1,12 @@
>  BR2_aarch64=y
>  BR2_cortex_a53=y
> -BR2_KERNEL_HEADERS_4_9=y

Doesn't this needs an explicit:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y

 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
