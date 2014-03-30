From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 11:31:25 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: fix EGL/GLES provider
In-Reply-To: <1396137768-22914-1-git-send-email-yann.morin.1998@free.fr>
References: <1396137768-22914-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140330113125.1fbf48ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 30 Mar 2014 01:02:48 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> mesa3d being selected is not enough for it to be an EGL provider.
> 
> The corresponding options BR2_PACKAGE_MESA3D_OPENGL_EGL should be
> enabled. This option already correctlt selects BR2_PACKAGE_HAS_OPENGL_EGL.
> 
> So, only declare mesa3d as an EGL provider if the option is set.
> 
> Ditto for GLES.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <berndkuhls@hotmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mesa3d/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
