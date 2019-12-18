From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Dec 2019 10:13:44 -0300
Subject: [Buildroot] [PATCH 2/2] configs/imx8qxpmek: Update to 4.14.98
 components
In-Reply-To: <cea508acd46cf9109f1ccb553ad8b429@cotds.org>
References: <20191217181855.3508-1-festevam@gmail.com>
 <20191217181855.3508-2-festevam@gmail.com>
 <CAOMZO5DhbKvUz3ZH7Pm1D3CtJ+h7-JCqeLSJP1U-Pa8FhjXNfQ@mail.gmail.com>
 <cea508acd46cf9109f1ccb553ad8b429@cotds.org>
Message-ID: <CAOMZO5BTdhASBtxW7qoU2_RiYdTDjLaNOL36SdNiFt5dDBGEdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Wed, Dec 18, 2019 at 10:08 AM Julien Olivain <juju@cotds.org> wrote:

> Apparently, we experience here what I described earlier, in [1].
> Updating U-Boot, Kernel and ATF will also need to realign
> imx-sc-firmware
> to the same BSP version. When also applying patch [2] on top of yours,
> I was able to boot the board again.

Excellent! I don't have my imx8qxp mek board handy at the moment, but
I suggest bumping  to imx-sc-firmware-1.2.2.bin instead of 1.2.1, so
that it matches the version stated in the NXP 4.14.98 Release Notes.

Thanks
