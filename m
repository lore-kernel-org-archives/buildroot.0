From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:09:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: not
 available on powerpc/powerpc64
In-Reply-To: <20171201220645.26132-1-bernd.kuhls@t-online.de>
References: <20171201220645.26132-1-bernd.kuhls@t-online.de>
Message-ID: <20171201230940.3ed04cb6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Dec 2017 23:06:45 +0100, Bernd Kuhls wrote:

> diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
> index d5fe5e61cc..0ad7903bef 100644
> --- a/package/kodi-inputstream-adaptive/Config.in
> +++ b/package/kodi-inputstream-adaptive/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
>  	bool "kodi-inputstream-adaptive"
> +	depends on !BR2_powerpc && !BR2_powerpc64 && !BR2_powerpc64le

Could we do the opposite here, and add the list of supported
architectures instead ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
