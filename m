From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:37:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: bump to version 0.32.0
In-Reply-To: <20200920084052.728866-1-fontaine.fabrice@gmail.com>
References: <20200920084052.728866-1-fontaine.fabrice@gmail.com>
Message-ID: <20200920153708.446fba12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 10:40:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use github helper
> - Drop first patch (not needed since version 0.30.0 and
>   https://github.com/mpv-player/mpv/commit/9fd90c549c4022d7f9283adc1a97a076614c1458)
> - vapoursynth-lazy has been dropped since version 0.30.0 and
>   https://github.com/mpv-player/mpv/commit/fb8d240c4d045ca254aa6693c48aecc75954cba0
> - mali-fbdev has been dropped since version 0.30.0 and
>   https://github.com/mpv-player/mpv/commit/83d7123dc32e7fb8b1e05ed21af845707d115295
> - libdvread has been dropped since version 0.30.0 and
>   https://github.com/mpv-player/mpv/commit/62294049852549e99ec948e0df16452856afa0c1
> - libv4l2 has been dropped since version 0.30. and
>   https://github.com/mpv-player/mpv/commit/b30e85508a305d668db8419556d295a65ab08707
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...patch => 0001-fix-powerpc64-altivec.patch} |  0
>  ...don-t-check-for-fork-on-POSIX-checks.patch | 31 -------------------
>  package/mpv/mpv.hash                          |  4 +--
>  package/mpv/mpv.mk                            | 27 ++--------------
>  4 files changed, 5 insertions(+), 57 deletions(-)
>  rename package/mpv/{0002-fix-powerpc64-altivec.patch => 0001-fix-powerpc64-altivec.patch} (100%)
>  delete mode 100644 package/mpv/0001-wscript-don-t-check-for-fork-on-POSIX-checks.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
