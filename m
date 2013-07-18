From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jul 2013 23:52:53 +0200
Subject: [Buildroot] [PATCH v2 0/3] Upgrade ARC port to new toolchain
In-Reply-To: <1374184072-6531-1-git-send-email-mjonker@synopsys.com>
References: <1374184072-6531-1-git-send-email-mjonker@synopsys.com>
Message-ID: <20130718235253.3600712d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Thu, 18 Jul 2013 23:47:49 +0200, Mischa Jonker wrote:
> These three patches upgrade the ARC toolchain to GCC 4.8 and
> Binutils 2.23.2. This fixes multiple issues (including most
> autobuilder failures from the past couple of weeks).

Thanks!

While you're at it, have you followed the recent changes on floating
point support for ARM? How does floating point support works on ARC?
Completely soft-float? Hard float is possible? Always the same FPU?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
