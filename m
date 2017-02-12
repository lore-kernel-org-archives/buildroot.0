From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:41:45 +0100
Subject: [Buildroot] [PATCH v3] classpath: bump to version 0.99
In-Reply-To: <20170212020444.32045-1-m.hoffmann@cartelsol.com>
References: <20170212015451.16715-1-m.hoffmann@cartelsol.com>
 <20170212020444.32045-1-m.hoffmann@cartelsol.com>
Message-ID: <20170212154145.1def8a2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 03:04:44 +0100, Marcus Hoffmann wrote:

> -CLASSPATH_VERSION = 0.98
> +CLASSPATH_VERSION = 0.99
>  CLASSPATH_SITE = $(BR2_GNU_MIRROR)/classpath
>  CLASSPATH_CONF_OPTS = \
>  	--disable-examples \
> -	--disable-plugin \
>  	--disable-rpath \
>  	--disable-Werror \
>  	--disable-gconf-peer \
> -	--disable-tools
> +	--disable-gjdoc

There was a typo here: missing final backslash. Due to this, Buildroot
could not build this package at all. Did you test it before submitting
the patch? :-)

> +	--enable-tools

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
