From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:28:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.1.3
In-Reply-To: <20200603171335.13493-1-juju@cotds.org>
References: <20200603171335.13493-1-juju@cotds.org>
Message-ID: <20200604232833.003dfc39@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Jun 2020 19:13:35 +0200
Julien Olivain <juju@cotds.org> wrote:

> Changes since v2.1.2:
> https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.3
> - fix a cross-compilation failure from Win32 to WinARM
> - fix issues while fluid_player is seeking
> - fix a NULL pointer dereference if synth.dynamic-sample-loading is enabled
> - fix a NULL pointer dereference in delete_rvoice_mixer_threads()
> - fix a NULL pointer dereference in the soundfont loader
> - fix dsound driver playing garbage when terminating fluidsynth
> - avoid memory leaks when using libinstpatch
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
