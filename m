From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:39:16 +0200
Subject: [Buildroot] [PATCH] package/empty: bump to version 0.6.21b
In-Reply-To: <5400c0f018d40f4760a4a1276f5c713b5e0f5b62.1591877625.git.baruch@tkos.co.il>
References: <5400c0f018d40f4760a4a1276f5c713b5e0f5b62.1591877625.git.baruch@tkos.co.il>
Message-ID: <20200618223916.409324c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Jun 2020 15:13:45 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Tarball is now without a leading directory component. Don't strip
> leading patch component.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/empty/empty.hash | 2 +-
>  package/empty/empty.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
