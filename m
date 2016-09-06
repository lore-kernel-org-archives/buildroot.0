From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:52:13 +0200
Subject: [Buildroot] [PATCH 5/9] package/elementary: remove package
In-Reply-To: <1472848295-13734-5-git-send-email-romain.naour@gmail.com>
References: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
 <1472848295-13734-5-git-send-email-romain.naour@gmail.com>
Message-ID: <20160906215213.17d7d886@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Sep 2016 22:31:31 +0200, Romain Naour wrote:
> elementary package is now used anymore, remove it.

now -> not

> @@ -157,6 +157,13 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL
>  ###############################################################################
>  comment "Legacy options removed in 2016.08"
>  
> +config BR2_PACKAGE_ELEMENTARY
> +	bool "elementary package removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_EFL
> +	help
> +	  With EFL 1.18, elementary is now provided by the efl package.
> +

I've moved this so that it is under the options removed in 2016.11.

Applied to master with those two issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
