From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Oct 2019 01:00:31 +0200
Subject: [Buildroot] [PATCH] package/physfs: bump to version 3.0.2
In-Reply-To: <20190831104416.10983-1-romain.naour@gmail.com>
References: <20190831104416.10983-1-romain.naour@gmail.com>
Message-ID: <7455f9c4-65ca-b312-b757-619a7dbad84d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/08/2019 12:44, Romain Naour wrote:
> Updated License file hash due to updated copyright year for 2019.
> 
> See:
> https://icculus.org/pipermail/physfs/2019-March/001280.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/physfs/physfs.hash | 4 ++--
>  package/physfs/physfs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/physfs/physfs.hash b/package/physfs/physfs.hash
> index 3d97fe0b0d..a2219edd25 100644
> --- a/package/physfs/physfs.hash
> +++ b/package/physfs/physfs.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 b77b9f853168d9636a44f75fca372b363106f52d789d18a2f776397bf117f2f1  physfs-3.0.1.tar.bz2
> -sha256 7ce475991f6cc09958ef0d57312522eba78e36d984307c95f9a3965adf7e4e2b  LICENSE.txt
> +sha256 304df76206d633df5360e738b138c94e82ccf086e50ba84f456d3f8432f9f863  physfs-3.0.2.tar.bz2
> +sha256 d80c0b09a1c98c61667ea044eefa2fd98fb70bd5fe12c49ff52b1fc2289a6583  LICENSE.txt
> diff --git a/package/physfs/physfs.mk b/package/physfs/physfs.mk
> index 78176be4bf..9a3bd441a9 100644
> --- a/package/physfs/physfs.mk
> +++ b/package/physfs/physfs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHYSFS_VERSION = 3.0.1
> +PHYSFS_VERSION = 3.0.2
>  PHYSFS_SOURCE = physfs-$(PHYSFS_VERSION).tar.bz2
>  PHYSFS_SITE = https://icculus.org/physfs/downloads
>  
> 
