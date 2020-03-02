From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 2 Mar 2020 16:36:06 +0100
Subject: [Buildroot] [PATCH] package/systemd: also fix rpath for nspawn
In-Reply-To: <20200229144316.5283-1-yann.morin.1998@free.fr>
References: <20200229144316.5283-1-yann.morin.1998@free.fr>
Message-ID: <CAFvCimWKE4SPx0_EiB+oVrXwkEuTRKBB9PggvWivS816rxS6_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewd-by: J?r?my Rosen <jeremy.rosen@smile.fr>

Le sam. 29 f?vr. 2020 ? 15:43, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> Fixes:
>
> http://autobuild.buildroot.org/results/e03ae6a3209eea00459b94cee9c10fd4f2184fec/
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 6e31a14ac3..b5805e6470 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -571,6 +571,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
>  HOST_SYSTEMD_HOST_TOOLS = \
>         systemd-analyze \
>         systemd-mount \
> +       systemd-nspawn \
>         systemctl \
>         udevadm
>
> --
> 2.20.1
>
>

-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200302/00409526/attachment.html>
