From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Sep 2011 16:30:20 +0200
Subject: [Buildroot] [PATCH] add libfcgi to buildroot it will have
 compiling errors as long as -lm isnt added to the buildsystem of libfcgi
In-Reply-To: <1317219200-4655-1-git-send-email-bachmann@tofwerk.com>
References: <add fcgi-2.4.0 package to buildroot>
 <1317219200-4655-1-git-send-email-bachmann@tofwerk.com>
Message-ID: <20110928163020.6350cc9b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Good for the usage of git send-email!

The patch title is too long. There should be one first line of < 80
characters, and then if you need to put some other details: one blank
line, and then some other paragraphs.

And the -lm problem should be fixed rather than explained in the commit
log :-)

Le Wed, 28 Sep 2011 16:13:20 +0200,
Rico Bachmann <bachmann@tofwerk.com> a ?crit :

> +##############################################################################
> +#
> +# libfcgi
> +#
> +##############################################################################
> +LIBFCGI_VERSION = 2.4.0
> +LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
> +LIBFCGI_SITE = http://www.fastcgi.com/dist
> +LIBFCGI_INSTALL_STAGING = YES
> +LIBFCGI_INSTALL_TARGET = YES

Line not needed, this is the default.

> +LIBFCGI_CONF_OPT = --enable-shared

Line not needed, this is already part of the default configuration
options.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
