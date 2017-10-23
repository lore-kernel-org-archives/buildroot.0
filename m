From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Oct 2017 07:44:31 +0200
Subject: [Buildroot] [PATCH v2] mpv: add support for Raspberry Pi "rpi"
 output
In-Reply-To: <20171022172126.21775-1-mahyar.koshkouei@gmail.com>
References: <20171022172126.21775-1-mahyar.koshkouei@gmail.com>
Message-ID: <20171023074431.75d478ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration.

On Sun, 22 Oct 2017 18:21:26 +0100, Mahyar Koshkouei wrote:
> mpv now compiles with the "rpi" video driver that provides hardware
> acceleration on the Raspberry Pi.
> 
> Tested working on a Raspberry Pi 1 Model B+ and Zero.
> 
> Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - Changed patch to use pkgconfig (thanks to github.com/Coacher)
> ---
>  .../mpv/0003-rpi-build-Fix-linking-errors.patch    | 72 ++++++++++++++++++++++
>  package/mpv/mpv.mk                                 |  9 ++-
>  2 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 package/mpv/0003-rpi-build-Fix-linking-errors.patch
> 
> diff --git a/package/mpv/0003-rpi-build-Fix-linking-errors.patch b/package/mpv/0003-rpi-build-Fix-linking-errors.patch
> new file mode 100644
> index 0000000000..d1db6a51fa
> --- /dev/null
> +++ b/package/mpv/0003-rpi-build-Fix-linking-errors.patch
> @@ -0,0 +1,72 @@
> +diff --git a/waftools/checks/custom.py b/waftools/checks/custom.py

Patches must have a description and be Signed-off-by by you. Also,
since this patch has been contributed by someone else, a reference to
where the patch was found should be included.

Finally, it should be a Git formatted patch, because the upstream
project uses Git.

Could you rework this? It should then be fine to be merged.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
