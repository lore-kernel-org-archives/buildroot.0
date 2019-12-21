From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 22:24:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/libvdpau: bump to version 1.3
In-Reply-To: <20191221161718.1464070-1-fontaine.fabrice@gmail.com>
References: <20191221161718.1464070-1-fontaine.fabrice@gmail.com>
Message-ID: <20191221222451.38d40631@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Dec 2019 17:17:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to meson-package
> - Drop second patch (not needed anymore)
> - Drop third patch (after feedback from upstream:
>   https://gitlab.freedesktop.org/vdpau/libvdpau/merge_requests/5)
> - Disable documentation
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvdpau/0002-link-with-libx11.patch  | 33 -------------
>  .../0003-vdpau-module-searchpath.patch        | 48 -------------------
>  package/libvdpau/libvdpau.hash                |  6 +--
>  package/libvdpau/libvdpau.mk                  | 18 +++----
>  4 files changed, 12 insertions(+), 93 deletions(-)
>  delete mode 100644 package/libvdpau/0002-link-with-libx11.patch
>  delete mode 100644 package/libvdpau/0003-vdpau-module-searchpath.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
