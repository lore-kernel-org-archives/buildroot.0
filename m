From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:26:23 +0100
Subject: [Buildroot] [PATCH] Revert "package/iptables: nfsynproxy not
 available on musl"
In-Reply-To: <e55813c866d7c063a694ed54240c65ff73c87ae0.1487250853.git.baruch@tkos.co.il>
References: <e55813c866d7c063a694ed54240c65ff73c87ae0.1487250853.git.baruch@tkos.co.il>
Message-ID: <20170220222623.7cb3f8cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Feb 2017 15:14:13 +0200, Baruch Siach wrote:
> This reverts commit 497f15b301273cd81e54b4fcc5da6ab90e27796c.
> 
> As the comment says, musl version 1.1.13 contains commit 53f41fb568ae4.
> Buildroot now ships musl version 1.1.16, so enable build with musl.
> 
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/iptables/Config.in | 4 ----
>  1 file changed, 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
