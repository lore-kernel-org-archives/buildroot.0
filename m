From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 23:25:06 +0100
Subject: [Buildroot] [PATCH 1/2] package/fluidsynth: add sdl2 optional
 dependency
In-Reply-To: <20200424113928.213441-1-fontaine.fabrice@gmail.com>
References: <20200424113928.213441-1-fontaine.fabrice@gmail.com>
Message-ID: <20210107232506.65de496a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 13:39:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> sdl2 is an optional dependency (enabled by default) since version 2.1.0:
> https://github.com/FluidSynth/fluidsynth/commit/978283bbf0309191a441121b7ea867e41e329d3b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fluidsynth/Config.in     | 10 ++++++++++
>  package/fluidsynth/fluidsynth.mk |  7 +++++++
>  2 files changed, 17 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
