From: Markos Chandras <hwoarang@gentoo.org>
Date: Mon, 20 May 2013 12:32:37 +0100
Subject: [Buildroot] [PATCH] gitignore: remove the stale /dl entry
In-Reply-To: <1369032032-3799-1-git-send-email-baruch@tkos.co.il>
References: <1369032032-3799-1-git-send-email-baruch@tkos.co.il>
Message-ID: <CAG2jQ8jDy7uppv6JhucO+5Z+PWqiOxF3zJJXqnXxf_p+YqJeNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 20 May 2013 07:40, Baruch Siach <baruch@tkos.co.il> wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .gitignore |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/.gitignore b/.gitignore
> index bb02d9f..1c1f60e 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,5 +1,4 @@
>  /output
> -/dl
>  /.auto.deps
>  /.config.cmd
>  /.config.old
> --
> 1.7.10.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Why is this change needed? The dl/ directory is still present for me
and I see that
BR2_DL_DIR is set to $(TOPDIR)/dl in the Config.in file.

--
Regards,
Markos Chandras - Gentoo Linux Developer
http://dev.gentoo.org/~hwoarang
