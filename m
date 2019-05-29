From: Thomas Huth <huth@tuxfamily.org>
Date: Wed, 29 May 2019 17:14:58 +0200
Subject: [Buildroot] [PATCH 04/19] package/cmake: add hash for license
 file
In-Reply-To: <20190529033537.128311-5-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
 <20190529033537.128311-5-aduskett@gmail.com>
Message-ID: <9626aacb-db88-5b67-4362-68e56e890b72@tuxfamily.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/05/2019 05.35, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/cmake/cmake.hash | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index f138ac79a1..9e0159a3c8 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,2 +1,5 @@
>  # From http://www.cmake.org/files/v3.8/cmake-3.8.2-SHA-256.txt
>  sha256 da3072794eb4c09f2d782fcee043847b99bb4cf8d4573978d9b2024214d6e92d  cmake-3.8.2.tar.gz
> +
> +# Locally calculated
> +sha256 af3030e1bf1af2f534430fdfe3cfc5a617966648a2a7f0c06a631adc92be1e5f  Copyright.txt
> 

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
