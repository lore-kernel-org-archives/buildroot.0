From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Aug 2019 21:48:12 +0200
Subject: [Buildroot] Buildroot ts4800_defconfig no longer builds
In-Reply-To: <20190810105411.42aa7518@windsurf.home>
References: <20190810105411.42aa7518@windsurf.home>
Message-ID: <20190818214812.174377cb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patrick,

On Sat, 10 Aug 2019 10:54:11 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The ts4800_defconfig you have contributed to Buildroot no longer builds:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139300
> 
> The error is not visible directly in the Gitlab CI output, but
> inspecting the full build log reveals this:

A week later, the latest Gitlab CI pipeline still fails on this
defconfig:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/273673274

Do you think you will have a chance to fix this before the end of the
month ? If not, we will have to remove the defconfig, at least
temporarily.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
