From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 8 Feb 2018 19:17:07 +0000
Subject: [Buildroot] [PATCH] libgpiod: add hash for license file
In-Reply-To: <1518113576-7551-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1518113576-7551-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <20180208191707.GB10590@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  8 Feb 2018 23:42:56 +0530, Rahul Bedarkar <rahulbedarkar89@gmail.com> wrote:
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> ---
>  package/libgpiod/libgpiod.hash | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
> index 73150dc..6baeee2 100644
> --- a/package/libgpiod/libgpiod.hash
> +++ b/package/libgpiod/libgpiod.hash
> @@ -1,2 +1,4 @@
>  # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
>  sha256 50c7862428ca90b58672e2475aea66d33a6fc86c6bab1928c0660f3aedf44a37  libgpiod-0.3.2.tar.xz
> +# Hash for license file
> +sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
> -- 
> 2.7.4

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
 
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180208/fe536d43/attachment.asc>
