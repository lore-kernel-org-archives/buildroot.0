From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 11 Nov 2014 20:21:30 +0100
Subject: [Buildroot] [PATCH] docs/manual: cleanup github helper docs
In-Reply-To: <1415730836-14762-1-git-send-email-yann.morin.1998@free.fr>
References: <1415730836-14762-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAGduivzn2UifLJ-TQbn+9zjH_ci=WkxcFiM=4x5Hpxnft0u=GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all
On Nov 11, 2014 7:34 PM, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> Explicitly state that the github helper should not be used when there is
> a release tarball.
>
> Properly render the list by separating it from the previous paragraph.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  docs/manual/adding-packages-tips.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/docs/manual/adding-packages-tips.txt
b/docs/manual/adding-packages-tips.txt
> index 0c6018a..fb7f35a 100644
> --- a/docs/manual/adding-packages-tips.txt
> +++ b/docs/manual/adding-packages-tips.txt
> @@ -61,10 +61,11 @@ may be slightly different (e.g. it contains a
configure script so we don't
>  need to do AUTORECONF).
>
>  You can see on the release page if it's an uploaded tarball or a git tag:
> +
>  - If there is a green download button, like
>    https://github.com/zedshaw/mongrel2/releases/tag/v1.9.1[mongrel2],
then it
>    was uploaded by the maintainer and you should use the link of that
button to
> -  specify +FOO_SITE+.
> +  specify +FOO_SITE+, and not use the 'github' herlper.
Small typo here.
What do you think of ' and do not use' ?
>  - If there is grey download button, like
>    https://github.com/xbmc/xbmc/releases/tag/13.2-Gotham[xbmc], then it's
an
>    automatically generated tarball and you should use the 'github' helper
> --
> 1.9.1
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141111/1773e4d5/attachment.html>
