From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:49:51 +0200
Subject: [Buildroot] [PATCH] package/gst-omx: default to pass
 --with-omx-target=generic
In-Reply-To: <20190401101157.6510-1-peter@korsgaard.com>
References: <20190401101157.6510-1-peter@korsgaard.com>
Message-ID: <20190401224951.2d430ae5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  1 Apr 2019 12:11:56 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> target defaults to none, which isn't a legal target:
> 
> configure: Using none as OpenMAX IL target
> configure: error: invalid OpenMAX IL target, you must specify one of --with-omx-target={generic,rpi,bellagio,tizonia,zynqultrascaleplus}
> 
> Instead default to 'generic', fixing the build with E.G. nvidia-tegra23.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gstreamer1/gst-omx/gst-omx.mk | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
