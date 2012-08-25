From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 10:19:47 +0200
Subject: [Buildroot] [PATCH] syslinux: fix host build with newer Linux
 headers
In-Reply-To: <1345356100-23521-1-git-send-email-net147@gmail.com>
References: <1345356100-23521-1-git-send-email-net147@gmail.com>
Message-ID: <20120825101947.1479f89c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 19 Aug 2012 16:01:40 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> Signed-off-by: Jonathan Liu <net147@gmail.com>

Can you be more specific about which versions of the kernel headers are
causing problems? I've just built syslinux with a 3.4 kernel headers
based Buildroot toolchain, and it worked fine.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
