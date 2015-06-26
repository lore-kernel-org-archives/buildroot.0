From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Fri, 26 Jun 2015 18:50:32 +0200
Subject: [Buildroot] [PATCH 1/1] monkey: new package
In-Reply-To: <db63e621-3318-439a-9bbe-6bbc26980f84@MAIL-SINTERS-01.sinters-int.fr>
References: <db63e621-3318-439a-9bbe-6bbc26980f84@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <20150626165032.GT485@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 26/06/2015 at 15:37:36 +0000, Julien CORJON wrote :
> diff --git a/package/monkey/Config.in b/package/monkey/Config.in
> new file mode 100644
> index 0000000..519fd65
> --- /dev/null
> +++ b/package/monkey/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_MONKEY
> +        bool "monkey"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +        help
> +          Money Server is a fast and lightweight web server for Linux platforms.
         Typo -^


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
