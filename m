From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:21:47 +0200
Subject: [Buildroot] [PATCH] package/libpwquality: bump version to 1.4.1
In-Reply-To: <20190923084133.21385-1-stefan.sorensen@spectralink.com>
References: <20190923084133.21385-1-stefan.sorensen@spectralink.com>
Message-ID: <20190928212147.49c68b17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 08:41:49 +0000
"S?rensen, Stefan" <Stefan.Sorensen@spectralink.com> wrote:

> diff --git a/package/libpwquality/libpwquality.hash b/package/libpwquality/libpwquality.hash
> index 97490f818a..b63501fa16 100644
> --- a/package/libpwquality/libpwquality.hash
> +++ b/package/libpwquality/libpwquality.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha2561de6ff046cf2172d265a2cb6f8da439d894f3e4e8157b056c515515232fade6blibpwquality-1.4.0.tar.bz2
> +sha256a97d72b5c56b7e279c6e86dad70c1493ea5796f00a596fb9f3173b96f9bf5e46libpwquality-1.4.1.tar.bz2

I'm not sure what happened here, but as you can see, the spaces are missing.

I fixed that up and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
