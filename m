From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 22:27:51 +0200
Subject: [Buildroot] [RFC PATCH v2 0/8] Add pkg-meson infrastructure
In-Reply-To: <20180515195159.6694-1-eric.le.bihan.dev@free.fr>
References: <20180515195159.6694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180530222751.07b6e016@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 May 2018 21:51:51 +0200, Eric Le Bihan wrote:

> Eric Le Bihan (8):
>   pkg-meson: new infrastructure
>   docs/manual: document pkg-meson infra
>   meson: prevent RPATH stripping
>   libmpdclient: convert to pkg-meson infra
>   systemd: convert to pkg-meson infra
>   ncmpc: convert to pkg-meson infra
>   mpd-mpc: convert to pkg-meson infra
>   enlightenment: convert to pkg-meson infra

Thanks, I've applied this patch series to the next branch. I've made a
few changes on PATCH 1/8, I'll comment on this patch.

Thanks a lot for this work!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
