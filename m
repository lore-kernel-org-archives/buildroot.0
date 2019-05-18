From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 22:07:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/busybox: select individual
 libraries when selecting SELinux support.
In-Reply-To: <20190516155200.86689-1-aduskett@gmail.com>
References: <20190516155200.86689-1-aduskett@gmail.com>
Message-ID: <20190518220747.2121412f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Thu, 16 May 2019 11:52:00 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> From the help test of individual binaries:
> 
> With this option enabled, each applet is a separate binary, which is needed for
> proper operation with SELinux
> 
> As such, it only makes sense to select this option when SELinux support is
> selected as well.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/busybox/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, after slightly tweaking the commit log to reduce the
confusion it was causing IMO.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
