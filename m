From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 8 Mar 2018 11:43:30 +0000
Subject: [Buildroot] [PATCH 1/1] fbgrab: Fix some problems in the patch
 metadata
In-Reply-To: <1520505753-13884-1-git-send-email-timo.ketola@exertus.fi>
References: <1520505753-13884-1-git-send-email-timo.ketola@exertus.fi>
Message-ID: <20180308114330.GB20111@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  8 Mar 2018 12:42:33 +0200, Timo Ketola <timo.ketola@exertus.fi> wrote:
> The patch description was missing Upstream-Status tag. It was given in the
> commit which added this patch but not in the patch itself as should be.
> 
> Signed-off-by tag accidentally didn't follow the usual format.
> 
> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/fbgrab/0100-fix-pixfmt-report.patch | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/fbgrab/0100-fix-pixfmt-report.patch b/package/fbgrab/0100-fix-pixfmt-report.patch
> index 18bcf96..8cff7ef 100644
> --- a/package/fbgrab/0100-fix-pixfmt-report.patch
> +++ b/package/fbgrab/0100-fix-pixfmt-report.patch
> @@ -4,7 +4,9 @@ When fbgrab tells about the framebuffer pixel format, blue and green
>  are accidentally swapped in 'length' and 'msb_right' columns. Let's
>  order everything as RGB.
>  
> -Signed-off-by timo.ketola at exertus.fi
> +Upstream-Status: Submitted [Gunnar Monell <gmo@linux.nu>]
> +
> +Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
>  
>  diff -u a/fbgrab.c b/fbgrab.c
>  --- a/fbgrab.c	2018-03-07 11:42:04.739250433 +0200
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180308/498d1f32/attachment-0001.asc>
