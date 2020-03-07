From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:06:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump to version 2.64.0
In-Reply-To: <20200306211458.54107-1-james.hilliard1@gmail.com>
References: <20200306211458.54107-1-james.hilliard1@gmail.com>
Message-ID: <20200307220648.7df62529@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Mar 2020 14:14:58 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

>  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
> -LIBGLIB2_CONF_OPTS += -Dlibmount=true
> +LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
>  LIBGLIB2_DEPENDENCIES += util-linux
>  else
> -LIBGLIB2_CONF_OPTS += -Dlibmount=false
> +LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
>  endif

Any reason for this change ? It is not explained in the commit log, and
it's not obvious why it is needed.

Could you give a few more details?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
