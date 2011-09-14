From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Sep 2011 09:21:05 +0200
Subject: [Buildroot] [PATH 0/1] package/ncurses: disable use of the GPM
 library
In-Reply-To: <1315958717-9861-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1315958717-9861-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <20110914092105.78c61a10@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Sep 2011 02:05:16 +0200,
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :

> That host-ldd is then installed as $(HOST_DIR)/usr/bin/ldd, which is
> first in the PATH.

When you build uClibc for ARM, uClibc installs an host-ldd ? Why is
this ldd necessary ?

I don't criticize the --without-gpm fix, but I'm just wondering if that
ldd in $(HOST_DIR) could create other problems with other packages.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
