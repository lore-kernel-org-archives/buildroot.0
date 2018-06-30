From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 21:56:17 +0200
Subject: [Buildroot] [PATCH v2,1/1] libv4l: fix build with sdl2_image
In-Reply-To: <20180630184032.31750-1-fontaine.fabrice@gmail.com>
References: <20180630184032.31750-1-fontaine.fabrice@gmail.com>
Message-ID: <20180630215617.2a5a4a01@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 20:40:32 +0200, Fabrice Fontaine wrote:
> sdlcam test includes jpeglib.h so add a patch to disable it if jpeg is
> disabled
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/1eded8b44cc369550566c6ce0b3c042f1aec8d44
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1->v2 (after review of Thomas Petazzoni):
>  - Update patch to use HAVE_JPEG instead of adding --disable-tests

Applied to master, thanks. Please submit the patch upstream. The
previous patches I submitted to upstream libv4l were merged without
much problems, so it's definitely worth it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
