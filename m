From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 19:20:15 +0200
Subject: [Buildroot] [PATCH] qt: enable Script and WebKit modules for ARC
In-Reply-To: <1436968037-26800-1-git-send-email-abrodkin@synopsys.com>
References: <1436968037-26800-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150718192015.3676e5a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 15 Jul 2015 16:47:17 +0300, Alexey Brodkin wrote:

> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 306fe1f..cadc784 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -412,7 +412,8 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
>  	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
>  		BR2_microblazebe || BR2_mips || BR2_mipsel || \
>  		(BR2_mips64 || BR2_mips64el) && !BR2_MIPS_NABI32 || BR2_powerpc || \
> -		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || BR2_x86_64
> +		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || BR2_x86_64 || \
> +		BR2_arc

Alphabetic ordering was not correct (for both), so I've fixed that up
and applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
