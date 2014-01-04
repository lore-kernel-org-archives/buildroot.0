From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 4 Jan 2014 21:01:39 +0100
Subject: [Buildroot] [PATCH] manual: use current date/time for
	'generated on'
In-Reply-To: <1388852728-27381-1-git-send-email-yann.morin.1998@free.fr>
References: <1388852728-27381-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAHXCMML0F0i_8gWJ8z4ycPWrjBx_QUmV=-Jx8SgTS5KgXR9j6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/4 Yann E. MORIN <yann.morin.1998@free.fr>

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Currently, the manual uses the last modification date and time of
> manual.txt in the generated manual.
>
> This is confusing, especially for long-checked-out repositories where
> the top-level manual.txt has not changed since the check out. Moreover,
> the manual explicitly states 'generated on', which is confusing at best.
>
> Use the current date and time instead.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
>
Acked-by: Samuel Martin <s.martin49@gmail.com>


> ---
>  docs/manual/manual.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index 9ae658e..958afae 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -8,8 +8,8 @@ The Buildroot user manual
>  Buildroot usage and documentation by Thomas Petazzoni. Contributions
>  from Karsten Kruse, Ned Ludd, Martin Herren and others.
>
> -Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {docdate}
> -{doctime} from git revision {sys:git rev-parse --short HEAD}
> +Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on
> {localdate}
> +{localtime} from git revision {sys:git rev-parse --short HEAD}
>
>  image::logo.png[]
>
> --
> 1.8.1.2
>
>


-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140104/2917bfe3/attachment-0001.html>
