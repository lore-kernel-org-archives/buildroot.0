From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:50:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 require dynamic library for decklink plugin
In-Reply-To: <20190529171908.103008-1-aduskett@gmail.com>
References: <20190529171908.103008-1-aduskett@gmail.com>
Message-ID: <20190531225006.7f146dbd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 May 2019 13:19:08 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> The decklink plugin uses dlfcn.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
