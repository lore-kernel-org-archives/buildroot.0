From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:52:00 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/mesa3d: Do not select
 MESA3D_OPENGL_EGL for etnaviv
In-Reply-To: <20200409123518.19576-1-festevam@gmail.com>
References: <20200409123518.19576-1-festevam@gmail.com>
Message-ID: <20200411105200.683c16ea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 Apr 2020 09:35:14 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> As suggested by Thomas, BR2_PACKAGE_MESA3D_OPENGL_EGL should not
> be automatically selected by the etnaviv driver.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - None

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
