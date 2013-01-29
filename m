From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 29 Jan 2013 11:18:49 +0100
Subject: [Buildroot] [PATCH] Docu: Add LIBFOO_EXTRACT_CMDS
In-Reply-To: <1359453890-23460-1-git-send-email-sho@relinux.de>
References: <1359453890-23460-1-git-send-email-sho@relinux.de>
Message-ID: <CAHXCMM+zLhKOZaz9YAw=s147nSOBgP-WUAOFWhjaNafbjAQ4TA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephan,

2013/1/29 Stephan Hoffmann <sho@relinux.de>:
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
>  docs/manual/adding-packages-generic.txt |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 7b8561a..53c8c21 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -288,6 +288,9 @@ LIBFOO_VERSION = 2.32
>  Now, the variables that define what should be performed at the
>  different steps of the build process.
>
> +* +LIBFOO_EXTRACT_CMDS+ lists the actions to be performed to
> +  extract the package in case no standard method applies
It could be nice to add what are the standard/supported methods

> +
>  * +LIBFOO_CONFIGURE_CMDS+ lists the actions to be performed to
>    configure the package before its compilation.
>
> --
> 1.7.0.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Regards,

-- 
Samuel
