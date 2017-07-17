From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Jul 2017 11:29:17 +0200
Subject: [Buildroot] [PATCH] python-coherence: bump to the latest
 upstream commit
In-Reply-To: <20170714154335.31754-1-yegorslists@googlemail.com>
References: <20170714154335.31754-1-yegorslists@googlemail.com>
Message-ID: <20170717112917.5c1bb5e4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 17:43:35 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> python-coherence is now orphaned, so unless a new maintainer
> could be found, there is no ETA for the next release.
> 
> The setup.py file in the develop branch doesn't import other
> Python packages, so no need for the build time dependencies.
> 
> This approach also fixes:
> 
> http://autobuild.buildroot.net/results/675/675721f773795987a2468daa33f299f7dc6ddb8a
> http://autobuild.buildroot.net/results/cd9/cd99ac66af7a0cb24510bee78dd45884a8695776
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-coherence/python-coherence.hash | 2 +-
>  package/python-coherence/python-coherence.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
