From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 3 May 2021 19:31:40 +0800
Subject: [Buildroot] [PATCH v2 5/6] boot/beaglev-secondboot: new package
In-Reply-To: <20210502212141.934384-6-thomas.petazzoni@bootlin.com>
References: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
 <20210502212141.934384-6-thomas.petazzoni@bootlin.com>
Message-ID: <CAEUhbmVCZFUneU_7dZF1BdcHfWKKycynYcnGQLKc_OXiTUWoxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 3, 2021 at 5:21 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This packages allows to build the first stage bootloader used on the
> BeagleV, which is used even before the DDR initialization and
> OpenSBI/U-Boot. Yes, "secondboot" is strange for what is the first
> stage bootloader, but that's the upstream name.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  DEVELOPERS                                    |  1 +
>  boot/Config.in                                |  1 +
>  boot/beaglev-secondboot/Config.in             |  9 ++++++
>  boot/beaglev-secondboot/beaglev-secondboot.mk | 29 +++++++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 boot/beaglev-secondboot/Config.in
>  create mode 100644 boot/beaglev-secondboot/beaglev-secondboot.mk
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
