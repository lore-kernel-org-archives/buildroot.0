From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:13:51 +0200
Subject: [Buildroot] [PATCH 1/1] network-manager: bump to version 1.4.2
In-Reply-To: <20161002233008.15982-1-petr.vorel@gmail.com>
References: <20161002233008.15982-1-petr.vorel@gmail.com>
Message-ID: <20161003231351.628dfe67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Oct 2016 01:30:08 +0200, Petr Vorel wrote:
> Removed patches:
> * 0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch:
> no longer relevant (tested on 3.9 for raspberrypi)
> * 0002-accept-auto-mode-interfaces.patch: accepted upstream
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ..._user_ipv6ll_enabled-to-nm-platform-linux.patch | 87 ----------------------
>  .../0002-accept-auto-mode-interfaces.patch         | 26 -------
>  package/network-manager/network-manager.hash       |  4 +-
>  package/network-manager/network-manager.mk         |  4 +-
>  4 files changed, 4 insertions(+), 117 deletions(-)
>  delete mode 100644 package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch
>  delete mode 100644 package/network-manager/0002-accept-auto-mode-interfaces.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
