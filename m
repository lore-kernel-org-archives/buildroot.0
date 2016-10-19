From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 17:58:47 +0200
Subject: [Buildroot] [PATCH 1/2] liburcu: bump to version 0.9.2
In-Reply-To: <ef30f526d3d31123695b867262dac86030da8af2.1476867634.git.baruch@tkos.co.il>
References: <ef30f526d3d31123695b867262dac86030da8af2.1476867634.git.baruch@tkos.co.il>
Message-ID: <20161019175847.414390d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 12:00:33 +0300, Baruch Siach wrote:
> Drop aarch64 support patch; no longer needed.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/liburcu/0002-support-aarch64.patch | 21 ---------------------
>  package/liburcu/liburcu.hash               |  6 +++---
>  package/liburcu/liburcu.mk                 |  3 +--
>  3 files changed, 4 insertions(+), 26 deletions(-)
>  delete mode 100644 package/liburcu/0002-support-aarch64.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
