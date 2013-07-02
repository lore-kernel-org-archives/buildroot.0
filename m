From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Tue, 2 Jul 2013 10:11:11 +0800
Subject: [Buildroot] [git commit] bwm-ng: move to appropiate category
In-Reply-To: <20130605090359.015649A95D@busybox.osuosl.org>
References: <20130605090359.015649A95D@busybox.osuosl.org>
Message-ID: <CAJhJPsVBJKoRH5W=_iAKv4ReqUMH7=X4EZCX4=4TT6gMn2YK_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo & Peter,
Last year, I submitted a patch to move bwm-ng from "Networking
applications" to "System tools".
Because bwm-ng can monitor not only network bandwidth but also disk-io
bandwidth.
So, could you just leave it as it is?

2013/6/5 Peter Korsgaard <jacmet@sunsite.dk>

> commit:
> http://git.buildroot.net/buildroot/commit/?id=0b6af1af6fee511b5565dc3ca791e6ac9458ca15
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> bwm-ng is a networking application, not a system one.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  package/Config.in |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/Config.in b/package/Config.in
> index 0d4ed90..f26b1aa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -682,6 +682,7 @@ source "package/boa/Config.in"
>  source "package/bind/Config.in"
>  source "package/bmon/Config.in"
>  source "package/bridge-utils/Config.in"
> +source "package/bwm-ng/Config.in"
>  source "package/can-utils/Config.in"
>  source "package/chrony/Config.in"
>  source "package/connman/Config.in"
> @@ -854,7 +855,6 @@ source "package/attr/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  source "package/bootutils/Config.in"
>  endif
> -source "package/bwm-ng/Config.in"
>  source "package/cpuload/Config.in"
>  source "package/htop/Config.in"
>  source "package/keyutils/Config.in"
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Best Regards!
Kelvin Cheung
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130702/34a03e6b/attachment.html>
