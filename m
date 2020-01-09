From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Jan 2020 17:17:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.34.0
In-Reply-To: <20200109081650.28912-3-asafka7@gmail.com>
References: <20200109081650.28912-1-asafka7@gmail.com>
 <20200109081650.28912-3-asafka7@gmail.com>
Message-ID: <20200109171745.6fdfa641@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 Jan 2020 10:16:48 +0200
Asaf Kahlon <asafka7@gmail.com> wrote:

> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/libuv/libuv.hash | 2 +-
>  package/libuv/libuv.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
> index 3890c8af94..e49822ad0d 100644
> --- a/package/libuv/libuv.hash
> +++ b/package/libuv/libuv.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  63794499bf5da1720e249d3fc14ff396b70b8736effe6ce5b4e47e0f3d476467  libuv-1.33.1.tar.gz
> +sha256  2c36b49bcf82c0d06ab0d77f98805605efa071d58ca29dee7c790912598b005d  libuv-1.34.0.tar.gz
>  sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
> diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
> index 618b25d5f6..4865c54551 100644
> --- a/package/libuv/libuv.mk
> +++ b/package/libuv/libuv.mk
> @@ -6,7 +6,7 @@
>  
>  # When bumping libuv, check if a new version of uvw is available
>  # and bump it too.

This comment says to also bump uvw at the same time, and indeed, uvw
has a new release that matches libuv 1.34. Could you provide a patch
that updates both ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
