From: Thomas Huth <huth@tuxfamily.org>
Date: Thu, 30 May 2019 17:03:17 +0200
Subject: [Buildroot] [PATCH 14/19] package/parted: add hash for license
 file
In-Reply-To: <20190529033537.128311-15-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
 <20190529033537.128311-15-aduskett@gmail.com>
Message-ID: <20190530170317.36644b61@thl530.multi.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 28 May 2019 23:35:32 -0400
schrieb aduskett at gmail.com:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/parted/parted.hash | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/parted/parted.hash b/package/parted/parted.hash
> index e31ae3c4ce..7b04128bea 100644
> --- a/package/parted/parted.hash
> +++ b/package/parted/parted.hash
> @@ -1,2 +1,5 @@
>  # Locally calculated after checking pgp signature
>  sha256
> 858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4
> parted-3.2.tar.xz + +# Locally calculated
> +sha256
> 0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf
> COPYING

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
