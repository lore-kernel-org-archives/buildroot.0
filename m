From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:05:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: wayland support needs
 wayland-protocols
In-Reply-To: <20190809172637.27687-1-bernd.kuhls@t-online.de>
References: <20190809172637.27687-1-bernd.kuhls@t-online.de>
Message-ID: <20190809220519.2a3e82cf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  9 Aug 2019 19:26:37 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The dependency for wayland-protocols was added with version 0.28.0:
> https://github.com/mpv-player/mpv/commit/68f9ee7e0b3fdddfa42fa11a15d9ae84460d5e19#diff-dc6134e3d3c869a052520d86f46371dc
> 
> Fixes:
> http://autobuild.buildroot.net/results/d5c/d5c5a31bc422defdd64ff0b0ca975bcd605f22be/
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mpv/Config.in | 1 +
>  package/mpv/mpv.mk    | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
