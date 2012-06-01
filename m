From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jun 2012 18:21:20 +0200
Subject: [Buildroot] [PATCH] quota: new package (v7)
In-Reply-To: <1338566735-12243-1-git-send-email-jarkko.sakkinen@intel.com>
References: <1338566735-12243-1-git-send-email-jarkko.sakkinen@intel.com>
Message-ID: <20120601182120.53b33729@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri,  1 Jun 2012 19:05:35 +0300,
Jarkko Sakkinen <jarkko.sakkinen@intel.com> a ?crit :

> + +QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(CFLAGS) -D_GNU_SOURCE"

No, it should be

	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
