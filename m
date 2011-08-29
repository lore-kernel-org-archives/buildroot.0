From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2011 14:33:14 +0200
Subject: [Buildroot] [PATCH] New package: bluez-utils
In-Reply-To: <4E54B7CB.500@visionsystems.de>
References: <4E54B7CB.500@visionsystems.de>
Message-ID: <20110829143314.517ae5ad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 24 Aug 2011 10:35:23 +0200,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> +BLUEZ_UTILS_CONF_OPT = --enable-hidd --enable-test --enable-alsa

If it uses alsa, then maybe some dependency on alsa-lib is needed, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
