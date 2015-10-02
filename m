From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 20:08:58 +0100
Subject: [Buildroot] [PATCH 1/2] imx-vpu: remove kernel dependency
In-Reply-To: <0bc73d48fdc587c9efd46e5d1c18bd1485bc1e28.1441212853.git.baruch@tkos.co.il>
References: <0bc73d48fdc587c9efd46e5d1c18bd1485bc1e28.1441212853.git.baruch@tkos.co.il>
Message-ID: <20151002200858.216705dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed,  2 Sep 2015 19:54:12 +0300, Baruch Siach wrote:
> The imx-vpu package builds just fine without any special kernel header.
> 
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/freescale-imx/imx-vpu/Config.in  | 5 -----
>  package/freescale-imx/imx-vpu/imx-vpu.mk | 5 +----
>  2 files changed, 1 insertion(+), 9 deletions(-)

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
