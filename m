From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 12:02:23 +0200
Subject: [Buildroot] [PATCH next] package/tini: needs MMU
In-Reply-To: <20180823081753.17745-1-yann.morin.1998@free.fr>
References: <20180823081753.17745-1-yann.morin.1998@free.fr>
Message-ID: <20180823120223.004bd3cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Aug 2018 10:17:53 +0200, Yann E. MORIN wrote:
> tini uses fork(), so needs an MMU.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/410/410ad9ea6a6652a7db691f537acb38db279b996a/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Christian Stewart <christian@paral.in>
> ---
>  package/tini/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
