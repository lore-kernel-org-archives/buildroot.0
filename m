From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 25 Oct 2013 08:27:42 +0200
Subject: [Buildroot] [PATCH] packages/Config.in: Fix case on entries
	titles
In-Reply-To: <1382628930-23665-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1382628930-23665-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAAXf6LXQn-Ssw13BC3VxCqQLP-c0--5RD-ZduBhZ_64LWiodgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Thu, Oct 24, 2013 at 5:35 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> ---
>  package/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/Config.in b/package/Config.in
> index ebbdeb5..8519f45 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -169,7 +169,7 @@ source "package/gnuplot/Config.in"
>  source "package/jhead/Config.in"
>  source "package/rrdtool/Config.in"
>
> -comment "graphic libraries"
> +comment "Graphic libraries"
>  source "package/cegui06/Config.in"
>  source "package/directfb/Config.in"
>  source "package/directfb-examples/Config.in"
> @@ -196,7 +196,7 @@ source "package/sdl_net/Config.in"
>  source "package/sdl_sound/Config.in"
>  source "package/sdl_ttf/Config.in"
>
> -comment "other GUIs"
> +comment "Other GUIs"
>  source "package/efl/Config.in"
>  source "package/qt/Config.in"
>
> @@ -241,7 +241,7 @@ source "package/liberation/Config.in"
>  source "package/libsexy/Config.in"
>  source "package/x11r7/xkeyboard-config/Config.in"
>
> -comment "X Window managers"
> +comment "X window managers"
>  source "package/blackbox/Config.in"
>  source "package/enlightenment/Config.in"
>  source "package/fluxbox/Config.in"

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Maxime, when you send multiple versions of a patch, could you use v2,
v3, ... in the subject line (PATCH v2) to make it easier for reviewers
to distinghuish the different versions? Also below the changelog you
should put a description of the changes compared to the previous
version.
See http://buildroot.uclibc.org/downloads/manual/manual.html#_patch_revision_changelog

Also, I believe it is customary to resend the entire series when there
is a revision of one of its patches.

Thanks,
Thomas
