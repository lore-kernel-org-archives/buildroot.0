From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:29:26 +0200
Subject: [Buildroot] [RFC v1 11/13] package/gst1-rtsp-server: bump
 version to 1.18.0
In-Reply-To: <20200916194933.24921-11-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
 <20200916194933.24921-11-ps.report@gmx.net>
Message-ID: <20200923222926.3955eae2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 21:49:31 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - change home page url to https
> 
> - remove 0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
>   (upstream [1])
> 
> - meson options: doc=disabled
> 
> [1] https://gitlab.freedesktop.org/gstreamer/gst-rtsp-server/-/commit/95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...hen-cross-compiling-if-introspection.patch | 36 -------------------
>  package/gstreamer1/gst1-rtsp-server/Config.in |  2 +-
>  .../gst1-rtsp-server/gst1-rtsp-server.hash    |  8 ++---
>  .../gst1-rtsp-server/gst1-rtsp-server.mk      |  5 +--
>  4 files changed, 8 insertions(+), 43 deletions(-)
>  delete mode 100644 package/gstreamer1/gst1-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
