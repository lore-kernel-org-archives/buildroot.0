From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 22:45:18 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/nodejs: use shared c-ares
In-Reply-To: <1500378343-22978-1-git-send-email-martin@barkynet.com>
References: <1500378343-22978-1-git-send-email-martin@barkynet.com>
Message-ID: <20170719224518.6d365642@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 12:45:41 +0100, Martin Bark wrote:

> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 3022f9c..37d63d0 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -25,6 +25,7 @@ config BR2_PACKAGE_NODEJS
>  	# linking, but that's too much of a corner case to support it.
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_C_ARES

Alphabetic ordering here and in <pkg>_DEPENDENCIES would have been
better. I've fixed this and applied all three patches. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
