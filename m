From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Apr 2014 23:51:52 +0200
Subject: [Buildroot] [PATCH] ne10: bump version to 1.0.0
In-Reply-To: <99baf8d8d8d05b5f2de390deef6546acab0199dd.1396965306.git.baruch@tkos.co.il>
References: <99baf8d8d8d05b5f2de390deef6546acab0199dd.1396965306.git.baruch@tkos.co.il>
Message-ID: <20140408235152.66df3162@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue,  8 Apr 2014 16:55:06 +0300, Baruch Siach wrote:

> +-    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
> ++    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfloat-abi=softfp -mfpu=neon")

This will not work on hardfp toolchains.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
