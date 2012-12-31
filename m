From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Dec 2012 18:12:52 +0100
Subject: [Buildroot] [PATCH] tooclhain/internal: enable wordexp in uClibc
In-Reply-To: <1356959077-29498-1-git-send-email-yann.morin.1998@free.fr>
References: <1356959077-29498-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20121231181252.564740da@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 31 Dec 2012 14:04:37 +0100, Yann E. MORIN wrote:
> wordexp is used by tvheadend.
> 
> Although alegedly rarely used, we want all our packages to build
> with the internal toolchain backend, so we just enable it.

Please see my comment about tvheadend usage of wordexp before applying
this patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
