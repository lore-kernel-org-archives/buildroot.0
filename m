From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 16:54:59 +0100
Subject: [Buildroot] [PATCH 2 of 2] Introduction of Amlogic platform to
 buildroot
In-Reply-To: <l53633$d6q$3@ger.gmane.org>
References: <CADYw_J+dw+E6xCosXu=hOo172ZPu1QJgtVTrHmJEQ2eVa6BWWg@mail.gmail.
 com> <l53633$d6q$3@ger.gmane.org>
Message-ID: <20131102165459.09a35044@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stanislav Vasic,

On Sat, 2 Nov 2013 15:35:00 +0000 (UTC), Stanislav Vasic wrote:
> From 674615f2986c928cadd122377bbb4254192f5923 Mon Sep 17 00:00:00 2001
> From: Stanislav Vasic <svlasic@gmail.com>
> Date: Sat, 2 Nov 2013 16:07:38 +0100
> Subject: [PATCH] Introduce Amlogic MX platform to buildroot
> 
> Target platform options submenu added, currently used
> only for setting up proper configuration of buildroot
> for Amlogic MX platform.

I'm afraid, but we don't want to have per-SoC options in Buildroot. We
have discussed this in the past, and there are way too many ARM SoC to
make this reasonable. Why is this patch needed at all?

For all other ARM platforms, the user simply has to choose the
appropriate ARM core (Cortex-A8, Cortex-A9, Cortex-A15, etc.), and
that's it. We also provide default configurations (see the configs/
directory) for various well-known hardware platforms, and those
configurations correctly define which ARM core should be used.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
