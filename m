From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:27:43 +0200
Subject: [Buildroot] [RFC v1 03/13] package/gstreamer1: bump version to
 1.18.0
In-Reply-To: <20200916194933.24921-3-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
 <20200916194933.24921-3-ps.report@gmx.net>
Message-ID: <20200923222743.4d16f798@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 21:49:23 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - change home page url to https
> 
> - remove 0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
>   (upstream [1])
> 
> - meson options: add extra-checks=disabled, gst_parse=true, doc=disabled
>   (and re-order tools and gobjec-cast-checks according to meson_options.txt order)
> 
> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/35db4a2433fbdf8612cf98b5aab5b14aeb5372f8.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...hen-cross-compiling-if-introspection.patch | 36 -------------------
>  package/gstreamer1/gstreamer1/Config.in       |  2 +-
>  package/gstreamer1/gstreamer1/gstreamer1.hash |  6 ++--
>  package/gstreamer1/gstreamer1/gstreamer1.mk   |  9 +++--
>  4 files changed, 10 insertions(+), 43 deletions(-)
>  delete mode 100644 package/gstreamer1/gstreamer1/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
