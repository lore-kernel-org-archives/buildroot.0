From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2020 22:26:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.1.1
In-Reply-To: <20200224205850.3922373-1-fontaine.fabrice@gmail.com>
References: <20200224205850.3922373-1-fontaine.fabrice@gmail.com>
Message-ID: <20200224222632.4ddc30c0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Feb 2020 21:58:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - This will fix a static build failure with readline thanks to
>   https://github.com/FluidSynth/fluidsynth/commit/c538c9fa7e392ce16c3354696e7dc7781a78a300
> - Update indentation of hash file (two spaces)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/88609eefe55af2ca50d43e17d3424b923528b07a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fluidsynth/fluidsynth.hash | 4 ++--
>  package/fluidsynth/fluidsynth.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
