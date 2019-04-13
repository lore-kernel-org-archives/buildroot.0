From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 15:52:43 +0200
Subject: [Buildroot] [PATCH] package/musl: bump to version 1.1.22
In-Reply-To: <20190412081517.3028-1-joerg.krause@embedded.rocks>
References: <20190412081517.3028-1-joerg.krause@embedded.rocks>
Message-ID: <b77d1220-419b-ff34-6def-a2ff2e8ada7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2019 10:15, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/musl/musl.hash | 4 ++--
>  package/musl/musl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/musl/musl.hash b/package/musl/musl.hash
> index 9121424657..5644401770 100644
> --- a/package/musl/musl.hash
> +++ b/package/musl/musl.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature from
> -# http://www.musl-libc.org/releases/musl-1.1.21.tar.gz.asc
> -sha256  c742b66f6f49c9e5f52f64d8b79fecb5a0f6e0203fca176c70ca20f6be285f44  musl-1.1.21.tar.gz
> +# http://www.musl-libc.org/releases/musl-1.1.22.tar.gz.asc
> +sha256  8b0941a48d2f980fd7036cfbd24aa1d414f03d9a0652ecbd5ec5c7ff1bee29e3  musl-1.1.22.tar.gz
>  sha256  a3ae1b9fc5d4938f5734734383b9813d27a5652df23010c6f9d4c5419b239a41  COPYRIGHT
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index ff807c0cba..5db5bbd265 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MUSL_VERSION = 1.1.21
> +MUSL_VERSION = 1.1.22
>  MUSL_SITE = http://www.musl-libc.org/releases
>  MUSL_LICENSE = MIT
>  MUSL_LICENSE_FILES = COPYRIGHT
> 
