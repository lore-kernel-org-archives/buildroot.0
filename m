From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 2 May 2014 08:59:26 -0500
Subject: [Buildroot] [PATCH] system/Config.in: fix custom skeleton help
	text
In-Reply-To: <31b1f7dff163950c1236.1399007320@argentina>
References: <31b1f7dff163950c1236.1399007320@argentina>
Message-ID: <OF145AAB3A.C3AE47D9-ON86257CCC.004CA69F-86257CCC.004CD687@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 05/02/2014 
12:08:40 AM:

> Signed-off-by: Thomas De Schampheleire 
<thomas.de.schampheleire@gmail.com>
> 
> ---
>  system/Config.in |  2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -185,7 +185,7 @@ config BR2_ROOTFS_SKELETON_CUSTOM_PATH
>     string "custom target skeleton path"
>     default "system/skeleton"
>     help
> -     Path custom target skeleton.
> +     Path to custom target skeleton.

Acked-by: Ryan Barnett <rjbarnet@rockwellcollins.com

Thanks,
-Ryan
