From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jan 2012 09:30:08 +0100
Subject: [Buildroot] [PATCH 4/4] Update the documentation to add these
 changes
In-Reply-To: <ad9fb6b99c31f84658dcc8f15cbd5c2440ee0918.1326304128.git.maxime.ripard@free-electrons.com>
References: <cover.1326304128.git.maxime.ripard@free-electrons.com>
 <ad9fb6b99c31f84658dcc8f15cbd5c2440ee0918.1326304128.git.maxime.ripard@free-electrons.com>
Message-ID: <20120112093008.63cf020d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 11 Jan 2012 18:53:41 +0100,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> +* +LIBFOO_DEVICES+ lists the device files to be created by Buildroot
> +  when using the static device table. The syntax to use is the
> +  makedevs one.

Would be great to mention that <foo>_DEVICES and <foo>_PERMISSIONS are
optional, and where to find the makedevs syntax, or mention it directly
in the documentation (better).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
