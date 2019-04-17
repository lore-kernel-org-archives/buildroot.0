From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:41:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: bump version to 1.15.12
In-Reply-To: <20190416174031.22170-1-aduskett@gmail.com>
References: <20190416174031.22170-1-aduskett@gmail.com>
Message-ID: <20190417084154.44bfd668@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Apr 2019 13:40:31 -0400
aduskett at gmail.com wrote:

> diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
> index 40dba402e2..114bf292ce 100644
> --- a/package/nginx/nginx.hash
> +++ b/package/nginx/nginx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256	8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93	nginx-1.15.7.tar.gz
> +sha256	3d5b90aa17de1700709ae4ec6c4d73d87c888b06c510391bf7104b006fdb2abe	nginx-1.15.12.tar.gz
>  # License files, locally calculated
> -sha256	e18f05bcaad47528f8b21861d4a0fb9815ca1bbb4be946c51a51d36623758bcc	LICENSE
> +sha256	28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509	LICENSE

You forgot to explain in the commit log why the license file hash has
changed, so I checked why, updated the commit log and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
