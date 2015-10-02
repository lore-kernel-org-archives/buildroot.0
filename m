From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 21:24:02 +0100
Subject: [Buildroot] [PATCH] package/intel-iqvlinux-driver: new package
In-Reply-To: <1443789136-31294-1-git-send-email-romain.naour@openwide.fr>
References: <1443789136-31294-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151002212402.6e506992@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri,  2 Oct 2015 14:32:16 +0200, Romain Naour wrote:

> diff --git a/package/Config.in b/package/Config.in
> index 79cbbe6..7ae836f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -130,6 +130,7 @@ endif
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/grep/Config.in"
>  endif
> +	source "package/intel-iqvlinux-driver/Config.in"

I would probably put it in "Hardware handling" instead of "Development
tools".

Also, shouldn't the name of the package be just iqvlinux instead of
intel-iqvlinux-driver ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
