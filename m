From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 21:21:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpfm4: bump to version 4.11.0
In-Reply-To: <20200914174619.3409389-1-fontaine.fabrice@gmail.com>
References: <20200914174619.3409389-1-fontaine.fabrice@gmail.com>
Message-ID: <20200914212150.0f4c5cc4@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 19:46:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Major updates:
>  - AMD Zen1 core PMU updates
>  - AMD Zen2 core PMU support
>  - Intel Icelake core PMU support
>  - support to report if events are speculative
>  - support for Extended PEBS events on Icelake
>  - Intel Tremont core PMU support
>  - ARM Neoverse N1 core PMU support
>  - s390 event table updates
>  - Marvell TX2 core and uncore updates
>  - Intel CascadeLakeX uncore PMU support
>  - Various other event table updates and bug fixes
> 
> http://perfmon2.sourceforge.net/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpfm4/libpfm4.hash | 6 +++---
>  package/libpfm4/libpfm4.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
