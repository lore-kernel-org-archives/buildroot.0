From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 26 Jan 2009 07:18:22 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsexy
In-Reply-To: <20090124064414.E9EDE769CC@busybox.osuosl.org>
References: <20090124064414.E9EDE769CC@busybox.osuosl.org>
Message-ID: <20090126071822.32c42258@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 24 Jan 2009 06:44:14 +0000 (UTC)
jacmet at uclibc.org wrote:

<snipp>

> --- trunk/buildroot/package/libsexy/Config.in	2009-01-24
> 06:44:04 UTC (rev 24995) +++
> trunk/buildroot/package/libsexy/Config.in	2009-01-24 06:44:13
> UTC (rev 24996) @@ -1,6 +1,7 @@ config BR2_PACKAGE_LIBSEXY
>  	bool "libsexy"
>  	depends on BR2_PACKAGE_LIBGTK2
> +	select BR2_PACKAGE_LIBXML2
>  	help
>  	  libsexy is a collection of GTK+ widgets that extend the
>  	  functionality of such standard widgets as GtkEntry and
> @@ -8,3 +9,4 @@
>  	  limitations of the widgets.
>  
>  	  http://www.chipx86.com/wiki/Libsexy
> +
> 

Why this extra whitespace?

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
