From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 20:26:11 +0200
Subject: [Buildroot] [PATCH v2] package/libedit: switch to alternate URL
 for proper packaging
In-Reply-To: <1375116257-27967-1-git-send-email-yann.morin.1998@free.fr>
References: <1375116257-27967-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130729202611.3b68bd14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 29 Jul 2013 18:44:17 +0200, Yann E. MORIN wrote:

> -LIBEDIT_DEPENDENCIES    = host-pmake libbsd ncurses

Does this implies we can get rid of the pmake and libbsd packages?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
