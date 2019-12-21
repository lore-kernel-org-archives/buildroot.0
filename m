From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 23:09:02 +0100
Subject: [Buildroot] [PATCH] configs/imx6-sabresd_qt5: Select
 videotestsrc plugin
In-Reply-To: <20191220013442.8231-1-festevam@gmail.com>
References: <20191220013442.8231-1-festevam@gmail.com>
Message-ID: <20191221230902.5eb2eeae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Dec 2019 22:34:42 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> The videotestsrc Gstreamer plugin is very useful for testing.
> 
> Enable it by default.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6-sabresd_qt5_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
