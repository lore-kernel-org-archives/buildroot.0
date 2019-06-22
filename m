From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:58:38 +0200
Subject: [Buildroot] [PATCH v4 01/15] package/glibc/arc: fix build issue
 with gcc-9.1
In-Reply-To: <20190620100725.105587-2-giulio.benetti@micronovasrl.com>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-2-giulio.benetti@micronovasrl.com>
Message-ID: <20190622205838.61ce448c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 12:07:11 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> From: Romain Naour <romain.naour@gmail.com>
> 
> Backport from upstream [1] to fix build issue with glibc arc-2018.09-release
> (based on glibc 2.28) and gcc 9.1 [2]]
> 
> Using glibc arc-2.29-2019.02.08 or the upcoming arc-2019.03 release include
> this patch.

Since then, we have indeed updated ARC glibc's version to 2019.03, so
this patch is no longer necessary if I understood correctly. I marked
it as "Not Applicable" in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
