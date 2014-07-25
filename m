From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 00:32:03 +0200
Subject: [Buildroot] [PATCH 0/2] gst-fsl-plugins: requires kernel
 headers <= 3.10 (branch yem/quickies)
In-Reply-To: <cover.1406323367.git.yann.morin.1998@free.fr>
References: <cover.1406323367.git.yann.morin.1998@free.fr>
Message-ID: <20140726003203.355212eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 25 Jul 2014 23:28:11 +0200, Yann E. MORIN wrote:

> As reported by Gary, gst-fsl-plugins use part of the v4l2 API that was
> removed in linux 3.11, so it should not be made available for toolchains
> with kernel headers >= 3.11, but only for headers <= 3.10.

That's kind of odd. Isn't the kernel to userspace API supposed to
remain backward compatible? Isn't this rather a story of custom v4l2
APIs added by Freescale but never mainlined?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
