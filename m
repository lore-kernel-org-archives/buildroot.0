From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 23:25:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/fluidsynth: add systemd
 optional dependency
In-Reply-To: <20200424113928.213441-2-fontaine.fabrice@gmail.com>
References: <20200424113928.213441-1-fontaine.fabrice@gmail.com>
 <20200424113928.213441-2-fontaine.fabrice@gmail.com>
Message-ID: <20210107232510.63de3904@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 13:39:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> systemd is an optional dependency (enabled by default) since version
> 2.0.5 and
> https://github.com/FluidSynth/fluidsynth/commit/099369f8b7f39afe08b6a518195948b05a937af3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fluidsynth/fluidsynth.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
