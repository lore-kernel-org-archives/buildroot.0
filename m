From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 May 2021 22:29:42 +0200
Subject: [Buildroot] [PATCH] Makefile: remove pkg-stats data on clean
In-Reply-To: <20210518202817.2197910-1-yann.morin.1998@free.fr>
References: <20210518202817.2197910-1-yann.morin.1998@free.fr>
Message-ID: <20210518222942.65638d48@windsurf.orange-hotspot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 May 2021 22:28:17 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Like commit 1f187371d002 for cpe-updates data, also remove pkg-stats
> data on clean.
> 
> Unlike the rest, those are not nicely located in a directory of their
> own, and have no variable name associated with them, so we just need
> to repeat their names in the clean rule.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
