From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 15:13:56 +0200
Subject: [Buildroot] Buildroot radxa_rock_pi4_defconfig no longer builds
In-Reply-To: <20190810143930.5235b4a7@windsurf.home>
References: <20190810143635.27e1b850@windsurf.home>
 <20190810143930.5235b4a7@windsurf.home>
Message-ID: <20190810151356.3adb7dab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Aug 2019 14:39:30 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The pine64_rockpro64_defconfig is affected by the same issue:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139227

More in the same situation:

 * nanopi_neo4_defconfig:

   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139189

 * nanopi_m4_defconfig

   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139188

 * nanopc_t4_defconfig

   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139185

So, it is really urgent to fix this issue. If it isn't fixed for the
2019.08 release (end of August), we will have to remove those
defconfigs, at least for now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
