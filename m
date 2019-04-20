From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 15:31:25 +0200
Subject: [Buildroot] [PATCH 01/10] package/gstreamer1/gst1-plugins-ugly:
 fix typo in mk file
In-Reply-To: <20190419211601.53431-1-aduskett@gmail.com>
References: <20190419211601.53431-1-aduskett@gmail.com>
Message-ID: <20190420153125.6af15499@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Apr 2019 17:15:52 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> BR2_PACKAGE_GST_PLUGINS_UGL1_PLUGIN_XINGMUX needs to be
> BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. Well spotted!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
