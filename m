From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 13:15:44 +0200
Subject: [Buildroot] [PATCH] package: drop remaining
 BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
In-Reply-To: <c9c1695b497981e2bb8195ebea87ed1c9ca550ec.1534923861.git.baruch@tkos.co.il>
References: <c9c1695b497981e2bb8195ebea87ed1c9ca550ec.1534923861.git.baruch@tkos.co.il>
Message-ID: <20180822131544.513cce5c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Aug 2018 10:44:21 +0300, Baruch Siach wrote:
> Commit 5a3f78c91915 (libaio: bump to 0.3.111) removed the definition of
> BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS, and most references. Remove a few
> remaining references.
> 
> Fixes:
> http://autobuild.buildroot.net/results/724/7244c23a0fbcf27547b5ea639d88033b5a7d9f39/
> http://autobuild.buildroot.net/results/be4/be43983767e94ab5c64c3cb3de467840fd6635d2/
> http://autobuild.buildroot.net/results/798/798a15a9a064d476927bb49bf534c427e9119c4e/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libiio/Config.in | 5 ++---
>  package/lvm2/Config.in   | 2 --
>  2 files changed, 2 insertions(+), 5 deletions(-)

I don't know how I could have missed those... next time I should really
wait for people to review my patches :-/

Thanks for fixing my mess, and sorry for creating it in the first
place :-/

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
