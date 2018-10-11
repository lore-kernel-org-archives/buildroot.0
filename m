From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:33:34 +0200
Subject: [Buildroot] [PATCH] scanpypi: improve BSD licence handling
In-Reply-To: <20181011055411.22801-1-yegorslists@googlemail.com>
References: <20181011055411.22801-1-yegorslists@googlemail.com>
Message-ID: <20181011093334.1e172e8b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 07:54:11 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> When used without spdx_lookup the BSD licence cannot be
> detected correctly because many Python packages just specify
> BSD without the exact version in their metadata. So add a
> special message warning the user instead of the licence id.
> 
> Bonus: fix typo.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  utils/scanpypi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
