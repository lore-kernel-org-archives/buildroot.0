From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 00:13:51 +0200
Subject: [Buildroot] [PATCH 12/54] libhid: add license information
In-Reply-To: <1403636160-11807-12-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-12-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624221351.GN31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

COPYING OK, yadda yadda... ;-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libhid/libhid.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
> index 30501d5..469a607 100644
> --- a/package/libhid/libhid.mk
> +++ b/package/libhid/libhid.mk
> @@ -9,6 +9,8 @@ LIBHID_SITE = http://sources.buildroot.net/
>  LIBHID_DEPENDENCIES = libusb-compat libusb
>  LIBHID_INSTALL_STAGING = YES
>  LIBHID_AUTORECONF = YES
> +LIBHID_LICENSE = GPLv2
> +LIBHID_LICENSE_FILES = COPYING
>  # configure runs libusb-config for cflags/ldflags. Ensure it picks up
>  # the target version
>  LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
> -- 
> 1.8.5.5
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
