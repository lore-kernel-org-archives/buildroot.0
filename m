From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 22:27:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.1.2
In-Reply-To: <20200408182503.10395-1-juju@cotds.org>
References: <20200408182503.10395-1-juju@cotds.org>
Message-ID: <20200408222759.1392c416@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Apr 2020 20:25:03 +0200
Julien Olivain <juju@cotds.org> wrote:

> Changes since v2.1.1:
> https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.2
> - fluidsynth now exits with error when user-provided command-line arguments are out-of-range
> - add verbose error logging to opensles and oboe drivers
> - fix a memory leak in oboe driver
> - fix a NULL dereference in the fluidsynth commandline program
> 
> ./utils/test-pkg --package fluidsynth
> 6 builds, 1 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
>  package/fluidsynth/fluidsynth.hash | 2 +-
>  package/fluidsynth/fluidsynth.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
