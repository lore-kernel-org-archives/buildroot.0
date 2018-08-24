From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:51:51 +0200
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.18.0
In-Reply-To: <08e0ff62e715901343733bf0fd3e4c51c7518cb6.1535029158.git.baruch@tkos.co.il>
References: <08e0ff62e715901343733bf0fd3e4c51c7518cb6.1535029158.git.baruch@tkos.co.il>
Message-ID: <20180824235151.4868e46a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Aug 2018 15:59:18 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...rdma-sync-some-IP-headers-with-glibc.patch | 39 -------------------
>  package/iproute2/iproute2.hash                |  2 +-
>  package/iproute2/iproute2.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 41 deletions(-)
>  delete mode 100644 package/iproute2/0001-rdma-sync-some-IP-headers-with-glibc.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
