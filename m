From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Sep 2015 10:11:28 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150904101128.4206779d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri,  4 Sep 2015 01:47:42 +0200, Yann E. MORIN wrote:

> +config BR2_ROOTFS_MERGED_USR
> +	bool "Use symlinks to /usr for /bin, /sbin and /lib"

Shouldn't we make this a blind option? I.e just do merged usr for
systemd always, and never do it for !systemd.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
