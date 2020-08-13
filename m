From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 22:42:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.1.4
In-Reply-To: <20200812171614.4812-1-juju@cotds.org>
References: <20200812171614.4812-1-juju@cotds.org>
Message-ID: <20200813224215.343bcc0c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Aug 2020 19:16:14 +0200
Julien Olivain <juju@cotds.org> wrote:

> Changes since v2.1.3:
> https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.4
> - fix an uninitialized memory access possibly triggering an FPE trap
> - fix several regressions introduced in 2.1.3:
>   - fluid_synth_start() failed for certain presets
>   - fix a NULL dereference in jack driver
>   - fix a stack-based overflow when creating the synth

Considering these are only fixes, and some even regression fixes, I've
applied this version bump to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
