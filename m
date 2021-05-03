From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 3 May 2021 19:30:13 +0800
Subject: [Buildroot] [PATCH v2 4/6] boot/beaglev-ddrinit: new package
In-Reply-To: <20210502212141.934384-5-thomas.petazzoni@bootlin.com>
References: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
 <20210502212141.934384-5-thomas.petazzoni@bootlin.com>
Message-ID: <CAEUhbmU0SRMbRt4Cb-i=WLCyNFsi+o-nKGkaxaJCxiFv4wVBjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 3, 2021 at 5:21 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This commit adds a package for the DDR initialization code used on the
> BeagleV platform.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  DEVELOPERS                              |  1 +
>  boot/Config.in                          |  1 +
>  boot/beaglev-ddrinit/Config.in          |  9 ++++++++
>  boot/beaglev-ddrinit/beaglev-ddrinit.mk | 29 +++++++++++++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 boot/beaglev-ddrinit/Config.in
>  create mode 100644 boot/beaglev-ddrinit/beaglev-ddrinit.mk
>

nits: please put secondBoot first in this patch series

I expect the ddrInit firmware is no longer necessary when upstream
U-Boot supports SPL for this target. For the time being, this patch
looks good.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
