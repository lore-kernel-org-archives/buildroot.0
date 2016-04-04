From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 4 Apr 2016 17:21:05 +0100
Subject: [Buildroot] [PATCH 1/1] network-manager: bump to version 1.0.12
In-Reply-To: <1459786791-4904-1-git-send-email-petr.vorel@gmail.com>
References: <1459786791-4904-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <57029471.8090801@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

your patch is a duplicate of this one:

http://patchwork.ozlabs.org/patch/605780/

Regards,

Vincent.

On 04/04/16 17:19, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/network-manager/network-manager.hash | 4 ++--
>  package/network-manager/network-manager.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> index c259b5a..e8a2be8 100644
> --- a/package/network-manager/network-manager.hash
> +++ b/package/network-manager/network-manager.hash
> @@ -1,2 +1,2 @@
> -# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.10.sha256sum
> -sha256  1bcfce8441dfd9f432a100d06b54f3831a2275cccc3b74b1b4c09a011e179fbc  NetworkManager-1.0.10.tar.xz
> +# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.12.sha256sum
> +sha256  3a470f8c60109b1acb5784ddc2423501706b5fe34c793a6faee87e591eb04a9e  NetworkManager-1.0.12.tar.xz
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index b49f3b8..12b8f3c 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  NETWORK_MANAGER_VERSION_MAJOR = 1.0
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).10
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
>  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>  NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>  NETWORK_MANAGER_INSTALL_STAGING = YES
> 
