From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 11:24:20 +0200
Subject: [Buildroot] [PATCH] cryptsetup: bump to version 2.0.4
In-Reply-To: <43f90f6702687a47c9295ea431e3652dfda02e47.1534497273.git.baruch@tkos.co.il>
References: <43f90f6702687a47c9295ea431e3652dfda02e47.1534497273.git.baruch@tkos.co.il>
Message-ID: <20180818112420.0dcb77eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Aug 2018 12:14:33 +0300, Baruch Siach wrote:
> libblkid is a new optional dependency. Upstream "strongly discourages"
> build without libblkid support. So enable libblkid unconditionally.
> 
> Cc: Martin Hicks <mort@bork.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> Note: I tested this patch on next after cherry picking commit bef1786475
> from master.
> ---
>  package/cryptsetup/Config.in       | 1 +
>  package/cryptsetup/cryptsetup.hash | 2 +-
>  package/cryptsetup/cryptsetup.mk   | 6 ++++--
>  3 files changed, 6 insertions(+), 3 deletions(-)

Applied to next (after cherry-picking bef1786475), thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
