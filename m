From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Apr 2012 09:25:21 +0200
Subject: [Buildroot] [PATCH] Add Netatalk
In-Reply-To: <1335423534-4278-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1335423534-4278-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20120426092521.6d5c6435@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Apr 2012 08:58:54 +0200,
Maxime Hadjinlian <maxime.hadjinlian@gmail.com> a ?crit :

> +NETATALK_CONF_OPT += --sysconfdir=/etc \

Just like --prefix, --sysconfdir is already passed by the AUTOTARGETS
infrastructure, and the value is /etc, so you can get rid of this
option.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
