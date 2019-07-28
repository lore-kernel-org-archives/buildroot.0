From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 10:06:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump to version
 4.92.1
In-Reply-To: <20190725171816.31519-1-bernd.kuhls@t-online.de>
References: <20190725171816.31519-1-bernd.kuhls@t-online.de>
Message-ID: <20190728100606.57b68a2b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Jul 2019 19:18:16 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> +EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf

Didn't you forget to send the patch adding a host variant for berkeleydb ?

I get this when building:

make[1]: *** No rule to make target 'host-berkeleydb', needed by '/home/thomas/projets/buildroot/output/build/exim-4.92.1/.stamp_configured'.  Stop.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
