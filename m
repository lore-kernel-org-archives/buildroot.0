From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Jun 2017 15:13:42 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/mesa3d: rename
 MESA3D_EGL_PLATFORMS to MESA3D_PLATFORMS
In-Reply-To: <20170617071957.9865-1-bernd.kuhls@t-online.de>
References: <20170617071957.9865-1-bernd.kuhls@t-online.de>
Message-ID: <20170617151342.24e904a2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Jun 2017 09:19:56 +0200, Bernd Kuhls wrote:
> No code changes, this patch prepares for updates to platform handling
> after upstream deprecated --with-egl-platforms in favour of
> --with-platforms
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=7748c3f5eb1d98ca97d2cf6e516ff54a5d75130a
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3. no changes
> v2: renamed variable to MESA3D_PLATFORMS (Thomas)
>     original patch: http://patchwork.ozlabs.org/patch/774339/

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
