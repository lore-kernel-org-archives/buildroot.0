From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 10:42:43 +0200
Subject: [Buildroot] [PATCH 2/3] Remove --disable-gtk-doc from packages,
 already defined in pkg-autotools.mk
In-Reply-To: <1413706270-27411-2-git-send-email-bernd.kuhls@t-online.de>
References: <1413706270-27411-1-git-send-email-bernd.kuhls@t-online.de>
 <1413706270-27411-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019084243.GB4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-19 10:11 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libglib2/libglib2.mk               |    1 -
>  package/network-manager/network-manager.mk |    1 -
>  package/systemd/systemd.mk                 |    1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index d7836a5..a64ef39 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -62,7 +62,6 @@ LIBGLIB2_CONF_ENV += ac_cv_header_sys_inotify_h=no
>  endif
>  
>  HOST_LIBGLIB2_CONF_OPTS = \
> -		--disable-gtk-doc \
>  		--disable-dtrace \
>  		--disable-systemtap \
>  		--disable-gcov \
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 9699eea..04104ac 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -29,7 +29,6 @@ NETWORK_MANAGER_CONF_OPTS = \
>  		--disable-qt \
>  		--disable-more-warnings \
>  		--without-docs \
> -		--disable-gtk-doc \
>  		--localstatedir=/var \
>  		--with-crypto=gnutls \
>  		--with-iptables=/usr/sbin/iptables \
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 94407ab..3aee67b 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -35,7 +35,6 @@ SYSTEMD_CONF_OPTS += \
>  	--disable-selinux \
>  	--disable-pam \
>  	--disable-libcryptsetup \
> -	--disable-gtk-doc \
>  	--with-dbuspolicydir=/etc/dbus-1/system.d \
>  	--with-dbussessionservicedir=/usr/share/dbus-1/services \
>  	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
