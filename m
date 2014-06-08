From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 18:53:03 +0200
Subject: [Buildroot] [PATCH 1/2] ti-gfx: use only -I${includedir} as
 pkg-config Cflags
In-Reply-To: <1401617908-6489-1-git-send-email-syntheticpp@gmx.net>
References: <1401617908-6489-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <20140608185303.2e593e07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter K?mmel,

On Sun,  1 Jun 2014 12:18:27 +0200, Peter K?mmel wrote:
> Using only -I${includedir} in common practice.
> 
> Settings only -I${includedir}/GLES2 breaks Qt5's CMake files,
> because at configure time CMake only searchs the paths reported
> by pkg-config, and not even /usr/include is used as default.
> 
> Even though pkg-config strips out standard include path, that's not
> the case with pkgconf (which we are using) in cross-compilation,
> which correctly reports the /usr/include dir prefixed with the
> sysroot.
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
