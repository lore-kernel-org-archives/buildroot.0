From: Thomas Huth <huth@tuxfamily.org>
Date: Thu, 30 May 2019 16:03:28 +0200
Subject: [Buildroot] [PATCH 09/19] package/gperf: add hash for license
 file
In-Reply-To: <20190529033537.128311-10-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
 <20190529033537.128311-10-aduskett@gmail.com>
Message-ID: <20190530160328.3f697228@thl530.multi.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 28 May 2019 23:35:27 -0400
schrieb aduskett at gmail.com:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gperf/gperf.hash | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
> index 370235c627..21c76605b5 100644
> --- a/package/gperf/gperf.hash
> +++ b/package/gperf/gperf.hash
> @@ -1,2 +1,5 @@
>  # Locally calculated after checking pgp signature
>  sha256
> 767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e
> gperf-3.0.4.tar.gz + +# Locally calculated
> +sha256
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> COPYING

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
