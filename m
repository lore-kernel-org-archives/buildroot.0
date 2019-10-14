From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:40:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.21.2
In-Reply-To: <20191014170700.31471-1-james.hilliard1@gmail.com>
References: <20191014170700.31471-1-james.hilliard1@gmail.com>
Message-ID: <20191014224059.0cc4d1ed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Oct 2019 11:07:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/network-manager/network-manager.hash | 6 +++---
>  package/network-manager/network-manager.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> index d65b933887..d0e5ddbfe2 100644
> --- a/package/network-manager/network-manager.hash
> +++ b/package/network-manager/network-manager.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.20.2.sha256sum
> -sha256 514e373f2c46536cacca644af859fb535c7a9ac4988a54d861d76f44c87fac84  NetworkManager-1.20.2.tar.xz
> +# From https://download.gnome.org/sources/NetworkManager/1.21/NetworkManager-1.21.2.sha256sum
> +sha256 99813d98a236a0b8198429cd59235cfdb14321f5ea8b16e4dee90bd4d186f412  NetworkManager-1.21.2.tar.xz
>  # Locally computed
> -sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING

We need changes in the hash file to be justified in the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
