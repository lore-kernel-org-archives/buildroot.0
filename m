From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 13:07:25 +0200
Subject: [Buildroot] [PATCH] package/weston: Add demo clients install
 option
In-Reply-To: <1468579851-415-1-git-send-email-xerpi.g.12@gmail.com>
References: <1468579851-415-1-git-send-email-xerpi.g.12@gmail.com>
Message-ID: <20160715130725.05e0af71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jul 2016 12:50:51 +0200, Sergi Granell wrote:
> ---
>  package/weston/Config.in | 3 +++
>  package/weston/weston.mk | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 0812279..9349317 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -104,4 +104,7 @@ config BR2_PACKAGE_WESTON_XWAYLAND
>  comment "XWayland support needs libepoxy and X.org enabled"
>  	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
>  
> +config BR2_PACKAGE_WESTON_DEMO_CLIENTS
> +	bool "demo clients"

The patch looks good, but could you send an updated version with some
help text for this option?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
