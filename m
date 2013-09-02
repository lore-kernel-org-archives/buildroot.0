From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Sep 2013 08:18:30 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bumped to version 206
In-Reply-To: <1377873128-19195-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1377873128-19195-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <52242DB6.5040609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/30/13 16:32, eric.le.bihan.dev at free.fr wrote:
[snip]
>   SYSTEMD_CONF_OPT += \
> -	--with-distro=other \
> +	--localstatedir=/var \
> +	--enable-static=no \
> +	--disable-manpages \
>   	--disable-selinux \
>   	--disable-pam \
>   	--disable-libcryptsetup \
> -	--disable-gtk \
> -	--disable-plymouth \
> -	--with-rootdir=/ \
>   	--with-dbuspolicydir=/etc/dbus-1/system.d \
>   	--with-dbussessionservicedir=/usr/share/dbus-1/services \
>   	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
>   	--with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
> -	--with-udevrulesdir=/etc/udev/rules.d \
> -	--with-sysvinit-path=/etc/init.d/  \

  Are these two really not needed anymore?

  Regards,
  Arnout

> -	--without-sysvrcd-path \
> -	--enable-split-usr
> +	--enable-split-usr \
> +	--enable-introspection=no \
> +	--disable-efi \
> +	--disable-myhostname \
> +	--without-python
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
