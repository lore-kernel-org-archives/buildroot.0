From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 21:48:38 +0200
Subject: [Buildroot] [PATCH next] iproute2: bump to version 4.11.0
In-Reply-To: <253a2c4e93de89e3b56f014ad580bd62064a3f94.1495467501.git.baruch@tkos.co.il>
References: <253a2c4e93de89e3b56f014ad580bd62064a3f94.1495467501.git.baruch@tkos.co.il>
Message-ID: <20170522214838.5d4b1d2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 May 2017 18:38:21 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Add a patch fixing struct ethhdr conflict using the Buildroot local if_ether.h
> kernel header suppression patch.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0003-ip-include-libc-headers-first.patch       | 35 ++++++++++++++++++++
>  .../0003-tc-add-missing-limits.h-header.patch      | 38 ----------------------
>  package/iproute2/iproute2.hash                     |  2 +-
>  package/iproute2/iproute2.mk                       |  2 +-
>  4 files changed, 37 insertions(+), 40 deletions(-)
>  create mode 100644 package/iproute2/0003-ip-include-libc-headers-first.patch
>  delete mode 100644 package/iproute2/0003-tc-add-missing-limits.h-header.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
