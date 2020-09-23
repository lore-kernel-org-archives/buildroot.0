From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:27:54 +0200
Subject: [Buildroot] [RFC v1 05/13] package/gst1-plugins-good: bump
 version to 1.18.0
In-Reply-To: <20200916194933.24921-5-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
 <20200916194933.24921-5-ps.report@gmx.net>
Message-ID: <20200923222754.7e92284e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 21:49:25 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - change home page url to https
> 
> - disable new plugin rpicamsrc (compile failure with current buildroot)
> 
> - meson options: add gobject-cast-checks=disabled, glib-asserts=disabled,
>   glib-checks=disabled, asm=disabled (needs host-nasm), doc=disabled
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer1/gst1-plugins-good/Config.in         |  2 +-
>  .../gst1-plugins-good/gst1-plugins-good.hash           |  6 +++---
>  .../gstreamer1/gst1-plugins-good/gst1-plugins-good.mk  | 10 ++++++++--
>  3 files changed, 12 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
