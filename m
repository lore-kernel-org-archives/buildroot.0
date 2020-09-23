From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:27:47 +0200
Subject: [Buildroot] [RFC v1 04/13] package/gst1-plugins-base: bump
 version to 1.18.0
In-Reply-To: <20200916194933.24921-4-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
 <20200916194933.24921-4-ps.report@gmx.net>
Message-ID: <20200923222747.3cb18008@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 21:49:24 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - change home page url to https
> 
> - remove 0001-meson-static-linkig-of-tools-needs-gmodule_dep.patch
>   (upstream [1])
> 
> - remove 0002-meson-build-gir-even-when-cross-compiling-if-introspection.patch
>   (upstream [2])
> 
> - meson options: remove gtk_doc, add doc=disabled
> 
> - add option for new plugin gio-typefinder
> 
> [1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/51253830f3e9dad108baa07c87ed62509ee3123f.patch
> [2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/30672ba7d134553e59935ddc875104adba26f25c.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...ic-linkig-of-tools-needs-gmodule_dep.patch | 38 -------------------
>  ...hen-cross-compiling-if-introspection.patch | 35 -----------------
>  .../gstreamer1/gst1-plugins-base/Config.in    |  7 +++-
>  .../gst1-plugins-base/gst1-plugins-base.hash  |  6 +--
>  .../gst1-plugins-base/gst1-plugins-base.mk    | 10 ++++-
>  5 files changed, 17 insertions(+), 79 deletions(-)
>  delete mode 100644 package/gstreamer1/gst1-plugins-base/0001-meson-static-linkig-of-tools-needs-gmodule_dep.patch
>  delete mode 100644 package/gstreamer1/gst1-plugins-base/0002-meson-build-gir-even-when-cross-compiling-if-introspection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
