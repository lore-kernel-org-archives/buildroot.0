From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jul 2011 19:09:58 +0200
Subject: [Buildroot] [PATCH] shared-mime-info: update to version 0.90
In-Reply-To: <1310575692-8877-1-git-send-email-s.neumann@raumfeld.com>
References: <1310575692-8877-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20110713190958.05f00698@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 13 Jul 2011 18:48:12 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

>  .../shared-mime-info-0.60-fix-xmllint.patch        |   17 -----------------

Patch mainlined ?

>  SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
> +SHARED_MIME_INFO_MAKE_OPT = -j1
>  
>  HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-intltool
>  
> -HOST_SHARED_MIME_INFO_CONF_OPT = \
> -	--disable-update-mimedb
> +HOST_SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
> +HOST_SHARED_MIME_INFO_MAKE_OPT = -j1


Usually, we do :

<pkg>_MAKE = $(MAKE1)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
