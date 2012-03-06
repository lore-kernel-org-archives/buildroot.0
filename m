From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Mar 2012 18:20:46 +0100
Subject: [Buildroot] [PATCH] Make libmicrohttpd version configurable
In-Reply-To: <1331054328-6564-1-git-send-email-rolandu@gmail.com>
References: <1331054328-6564-1-git-send-email-rolandu@gmail.com>
Message-ID: <20120306182046.56f21098@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue,  6 Mar 2012 19:18:48 +0200,
rolandu at gmail.com a ?crit :

> From: Roland Uuesoo <roland@martem.eu>

Except for some particular packages such as U-Boot or the kernel, which
are highly hardware-dependent, we generally don't like having multiple
version support for userspace libraries/applications.

Could you give us details as to why this would be needed specifically
for libmicrohttpd?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
