From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 23:24:31 +0100
Subject: [Buildroot] [PATCH 3/7] lttng-libust: bump to version 2.6.0
In-Reply-To: <1425663357-22541-4-git-send-email-eeppeliteloop@gmail.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
 <1425663357-22541-4-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <20150306232431.1faa871b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philippe Proulx,

On Fri,  6 Mar 2015 12:35:53 -0500, Philippe Proulx wrote:


>  LTTNG_LIBUST_INSTALL_STAGING = YES
>  LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
>  
> -ifeq ($(BR2_PACKAGE_PYTHON),y)
> -LTTNG_LIBUST_DEPENDENCIES += python
> -else ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -LTTNG_LIBUST_DEPENDENCIES += python3
> -else
> -LTTNG_LIBUST_CONF_ENV = am_cv_pathless_PYTHON="none"
> -endif

Why? This sort of change should at least be described in the commit
log, since it's clearly not a simple mechanical bump to 2.6.0.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
