From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:09:49 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/alsa-utils: Fix gettext
 related build error
In-Reply-To: <1413730150-19225-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413730150-19225-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141026220949.28c735c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 16:49:10 +0200, Bernd Kuhls wrote:
> ALSA_UTILS_GETTEXTIZE = YES
> 
> is also needed to fix
> 
> *** error: gettext infrastructure mismatch: using a Makefile.in.in from
> gettext version 0.18 but the autoconf macros are from gettext version 0.19
> 
> To reproduce the build error make sure gettext is build before alsa-utils
> by also applying this patch: http://patchwork.ozlabs.org/patch/400779/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Hum, I've built gettext and then alsa-utils, and I didn't see the
problem. Do you have a defconfig that exhibits the problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
