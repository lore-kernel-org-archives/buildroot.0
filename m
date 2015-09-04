From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 4 Sep 2015 11:46:14 +0200
Subject: [Buildroot] [PATCH 1/2] imx-vpu: remove kernel dependency
In-Reply-To: <0bc73d48fdc587c9efd46e5d1c18bd1485bc1e28.1441212853.git.baruch@tkos.co.il>
References: <0bc73d48fdc587c9efd46e5d1c18bd1485bc1e28.1441212853.git.baruch@tkos.co.il>
Message-ID: <CAAMH-ytoY6eJOs5r_pSpTf9fd4OB6+a4khFW2VmHsyD_TaVsGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Wed, Sep 2, 2015 at 6:54 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> The imx-vpu package builds just fine without any special kernel header.

Indeed it seems that it builds fine without it. Yocto recipe still
depends on the kernel but I see no point in keeping it.

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Thanks,
Gary
