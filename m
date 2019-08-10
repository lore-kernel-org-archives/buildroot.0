From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 14:39:30 +0200
Subject: [Buildroot] Buildroot radxa_rock_pi4_defconfig no longer builds
In-Reply-To: <20190810143635.27e1b850@windsurf.home>
References: <20190810143635.27e1b850@windsurf.home>
Message-ID: <20190810143930.5235b4a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Aug 2019 14:36:35 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The radxa_rock_pi4_defconfig in Buildroot doesn't build:
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/269139271

The pine64_rockpro64_defconfig is affected by the same issue:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139227

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
