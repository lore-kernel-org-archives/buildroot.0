From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 08:29:19 +0100
Subject: [Buildroot] [git commit master 1/1] ed: bump to version 1.5
In-Reply-To: <20101222232249.DB1F38E20B@busybox.osuosl.org>
References: <20101222232249.DB1F38E20B@busybox.osuosl.org>
Message-ID: <20101223082919.0d574cf8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Dec 2010 23:47:28 +0100
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> +ED_VERSION = 1.5
> +ED_SITE = $(BR2_GNU_MIRROR)/ed
> +ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)"

Sorry for this late review, but why is this ED_CONF_OPT needed ? We
already pass those variables through TARGET_CONFIGURE_OPTS.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
