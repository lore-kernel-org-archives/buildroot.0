From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2011 16:25:01 +0100
Subject: [Buildroot] [PATCH v2 2/2] New package: python-dpkt
In-Reply-To: <1323873386-31047-2-git-send-email-yegorslists@googlemail.com>
References: <1323873386-31047-1-git-send-email-yegorslists@googlemail.com>
 <1323873386-31047-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <20111214162501.75616803@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Dec 2011 15:36:26 +0100,
yegorslists at googlemail.com a ?crit :

> --- /dev/null
> +++ b/package/python-dpkt/python-dpkt-setup.patch
> @@ -0,0 +1,23 @@
> +---
> + setup.py |    7 +++----

Description + SoB line needed here. And also push upstream the patch
explaining why it is stupid do depends on the Python module to be
installed during the build process.

> +PYTHON_DPKT_SOURCE  = dpkt-$(PYTHON_DPKT_VERSION).tar.gz

That's the default value, so it could be dropped.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
