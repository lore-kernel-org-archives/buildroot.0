From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Sep 2011 15:03:59 +0200
Subject: [Buildroot] Q
In-Reply-To: <481531316090323@web55.yandex.ru>
References: <481531316090323@web55.yandex.ru>
Message-ID: <20110915150359.5d374965@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 15 Sep 2011 16:38:43 +0400,
????????? <sitesv@narod.ru> a ?crit :

> What i do wrong?

You mistakenly removed the value of the BR2_GNU_MIRROR configuration
option, so Buildroot has no idea where to download GNU packages.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
