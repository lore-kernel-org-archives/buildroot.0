From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Sep 2019 09:57:17 +0200
Subject: [Buildroot] [PATCH 1/1] move sdl_gfx package version from 1.0.1
 to 1.0.4
In-Reply-To: <20190911050651.31717-1-peter.macleod.thompson@gmail.com>
References: <20190911050651.31717-1-peter.macleod.thompson@gmail.com>
Message-ID: <20190911095717.10def3c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue, 10 Sep 2019 23:06:51 -0600
Peter Thompson <peter.macleod.thompson@gmail.com> wrote:

> From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> 
> changed sdl2_gfx_version to 1.0.4
> 
> Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> ---
>  package/sdl2_gfx/sdl2_gfx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the patch. However, you need to update the hash of the
tarball in the .hash file. Also, the commit title should be:

	package/sdl2_gfx: bump to 1.0.4

Could you adjust this (also for the sdl2_image patch) and send an
updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
