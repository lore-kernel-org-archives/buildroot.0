From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:39:16 +0100
Subject: [Buildroot] [PATCH 1/8] package/mesa3d-demos: bump version to
 8.3.0
In-Reply-To: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
References: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213143916.18c62c5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 12 Dec 2015 19:31:36 +0100, Bernd Kuhls wrote:
> Currently buildroot lacks glut support so add configure options to
> disable glut support, also disable osmesa support because it also
> depends on glut.
> 
> Re-numbered and rebased 0001-demos-optional-gl.patch
> 
> Removed patches:
> - 0001-demos-non-mesa-impl.patch
> All files related to this patch have been removed upstream:
> http://cgit.freedesktop.org/mesa/demos/commit/?id=74443c6ee79f3251f643ea05e94df58183e37d0d
> 
> - 0003-demos-x11-fix.patch
> Applied upstream:
> http://cgit.freedesktop.org/mesa/demos/commit/?id=6f7ad3f242943242021d1c42c6ed6933b76137fd
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../mesa3d-demos/0001-demos-non-mesa-impl.patch    | 244 ---------------------
>  ...ional-gl.patch => 0001-demos-optional-gl.patch} |  22 +-
>  package/mesa3d-demos/0003-demos-x11-fix.patch      |  30 ---
>  package/mesa3d-demos/mesa3d-demos.hash             |   4 +-
>  package/mesa3d-demos/mesa3d-demos.mk               |   4 +-
>  5 files changed, 17 insertions(+), 287 deletions(-)
>  delete mode 100644 package/mesa3d-demos/0001-demos-non-mesa-impl.patch
>  rename package/mesa3d-demos/{0002-demos-optional-gl.patch => 0001-demos-optional-gl.patch} (81%)
>  delete mode 100644 package/mesa3d-demos/0003-demos-x11-fix.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
