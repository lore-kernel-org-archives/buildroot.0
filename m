From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 15 Apr 2016 13:18:05 -0300
Subject: [Buildroot] [git commit] configs/minnowboard_max: configure
 eth0 through dhcp
In-Reply-To: <20160415081911.5BA4A80338@busybox.osuosl.org>
References: <20160415081911.5BA4A80338@busybox.osuosl.org>
Message-ID: <CAAEAJfDqYwZ5e4Tq8-BaUqT5fWb=R3aQ5Vf2nNTJ4s63ukwsPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 April 2016 at 05:17, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=ba40ce77ea7babb36a74adeb4772b54142f86975
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> The minnowboard max board has an ethernet port, so configure it at startup.
>

Any reason why you are only doing this change for the Minnowboard MAX,
and not also the Minnowboard?

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/minnowboard_max_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
> index 05df987..dfa1b6c 100644
> --- a/configs/minnowboard_max_defconfig
> +++ b/configs/minnowboard_max_defconfig
> @@ -4,6 +4,7 @@ BR2_x86_atom=y
>
>  # Misc
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_SYSTEM_DHCP="eth0"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard-max/post-image.sh"
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
