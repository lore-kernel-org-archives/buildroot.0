From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:04:33 +0200
Subject: [Buildroot] [PATCH] scanpypi: rework runtime dependency handling
In-Reply-To: <1467271504-929-1-git-send-email-yegorslists@googlemail.com>
References: <1467271504-929-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160701000433.1e389b0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Jun 2016 09:25:04 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> In most cases Python's package dependencies found in setup.py are
> runtime dependencies and hence don't need to be mentioned in *.mk
> file.
> 
> Also add '# runtime' tag to select statements in Config.in.
> 
> __create_mk_requirements() itself is left for future uses (cffi backend
> handling etc.).
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  support/scripts/scanpypi | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
