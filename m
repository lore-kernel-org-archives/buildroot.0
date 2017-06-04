From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:45:39 +0200
Subject: [Buildroot] [PATCH] iproute2: needs kernel headers 3.4+
In-Reply-To: <57d7063c549b528c75863ae3c0278f4fcc2439cc.1496525433.git.baruch@tkos.co.il>
References: <57d7063c549b528c75863ae3c0278f4fcc2439cc.1496525433.git.baruch@tkos.co.il>
Message-ID: <20170604094539.48a54323@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 00:30:33 +0300, Baruch Siach wrote:
> iproute2 needs the __kernel_long_t and __kernel_ulong_t types that were
> introduced in kernel v3.4.
> 
> Fixes:
> http://autobuild.buildroot.net/results/823/823f0dbe17999c07134fac5a0620e3ad15362204/
> http://autobuild.buildroot.net/results/a79/a797a6e3d193fa70abd59411df21657a1c0a45d4/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ifupdown/Config.in | 6 +++---
>  package/iproute2/Config.in | 6 +++---
>  package/openswan/Config.in | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
