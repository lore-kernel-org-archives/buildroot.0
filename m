From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 20:18:06 +0200
Subject: [Buildroot] [PATCH] libarchive: bump to version 3.1.2
In-Reply-To: <1406830232-27101-1-git-send-email-gustavo@zacarias.com.ar>
References: <1406830232-27101-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140731201806.50aaaaf9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 31 Jul 2014 15:10:32 -0300, Gustavo Zacarias wrote:

> +ifeq ($(BR2_PACKAGE_ACL),y)
> +LIBARCHIVE_DEPENDENCIES += acl

No --enable-acl ?

> +else
> +LIBARCHIVE_CONF_OPT += --disable-acl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_ATTR),y)
> +LIBARCHIVE_DEPENDENCIES += attr

Same here and for all other options?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
