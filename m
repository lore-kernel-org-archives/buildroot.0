From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 13:27:37 +0200
Subject: [Buildroot] [PATCH 4/4] package/liquid-dsp: bump version
In-Reply-To: <1465161963-32681-4-git-send-email-bernd.kuhls@t-online.de>
References: <1465161963-32681-1-git-send-email-bernd.kuhls@t-online.de>
 <1465161963-32681-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160607132737.34fa748c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Jun 2016 23:26:03 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream:
> https://github.com/jgaeddert/liquid-dsp/commit/c9d239490d47d5dd3d7d7b8b7d9007171c5f60ce
> https://github.com/jgaeddert/liquid-dsp/commit/3055eb3da9d0a202c1a975f7db0c8370a09a30bc
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...0001-configure.ac-use-AC_CONFIG_MACRO_DIR.patch | 45 ----------------------
>  ...rapping-isnan-in-T_ABS-to-help-compilatio.patch | 39 -------------------
>  package/liquid-dsp/liquid-dsp.hash                 |  2 +-
>  package/liquid-dsp/liquid-dsp.mk                   |  2 +-
>  4 files changed, 2 insertions(+), 86 deletions(-)
>  delete mode 100644 package/liquid-dsp/0001-configure.ac-use-AC_CONFIG_MACRO_DIR.patch
>  delete mode 100644 package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
