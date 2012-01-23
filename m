From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jan 2012 11:12:35 +0100
Subject: [Buildroot] [PATCH 1/2] re: new package
In-Reply-To: <1327240226-6082-1-git-send-email-arnout@mind.be>
References: <1327240226-6082-1-git-send-email-arnout@mind.be>
Message-ID: <20120123111235.58b957ff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 22 Jan 2012 14:50:24 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

>  package/Config.in    |    1 +
>  package/re/Config.in |   11 +++++++++++
>  package/re/re.mk     |   49 +++++++++++++++++++++++++++++++++++++++++++++++++

Upstream, the package seems to be named 'libre' (the tarball is named
re-..., but the library is documented as libre on the website),
shouldn't we use the same name in Buildroot?

> +define RE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 644 -D $(@D)/libre.so $(TARGET_DIR)/usr/lib/libre.so
> +endef

I guess that the package build system doesn't use .so versioning?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
