From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 1 May 2019 19:01:40 +0200
Subject: [Buildroot] [PATCH] package/network-manager: update to 1.18.0
In-Reply-To: <20190501072642.18350-1-lkundrak@v3.sk>
References: <20190501072642.18350-1-lkundrak@v3.sk>
Message-ID: <20190501170139.GA30182@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> A straightforward package update. Tested.

> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

> ---
>  package/network-manager/network-manager.hash | 4 ++--
>  package/network-manager/network-manager.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
...

> -NETWORK_MANAGER_VERSION_MAJOR = 1.14
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).6
> +NETWORK_MANAGER_VERSION_MAJOR = 1.18
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
>  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>  NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>  NETWORK_MANAGER_INSTALL_STAGING = YES

Thanks for your update.

BTW there is newer version 1.18.1.

Kind regards,
Petr
