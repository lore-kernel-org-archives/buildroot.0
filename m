From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:53:40 +0200
Subject: [Buildroot] [PATCH 6/9] package/libevas-generic-loaders: remove
 package
In-Reply-To: <1472848295-13734-6-git-send-email-romain.naour@gmail.com>
References: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
 <1472848295-13734-6-git-send-email-romain.naour@gmail.com>
Message-ID: <20160906215340.13ab1151@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Sep 2016 22:31:32 +0200, Romain Naour wrote:
> libevas-generic-loaders package is now used anymore, remove it.

now -> not


> diff --git a/Config.in.legacy b/Config.in.legacy
> index 03ac4f8..d9555f9 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -157,6 +157,14 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL
>  ###############################################################################
>  comment "Legacy options removed in 2016.08"
>  
> +config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
> +	bool "libevas-generic-loaders package removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_EFL
> +	help
> +	  With EFL 1.18, libevas-generic-loaders is now provided by the efl
> +	  package.
> +

Same as previous: I've moved this under the "options removed in
2016.11".

Applied with those issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
