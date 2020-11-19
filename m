From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 23:11:53 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/qcom-db410c-firmware: new
 package
In-Reply-To: <20201119090854.48955-2-mikeframpo@gmail.com>
References: <20201119090854.48955-1-mikeframpo@gmail.com>
 <20201119090854.48955-2-mikeframpo@gmail.com>
Message-ID: <20201119231153.5acac240@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Nov 2020 22:08:52 +1300
Mike Frampton <mikeframpo@gmail.com> wrote:

> Installs the required Wifi/BT firmware blobs for the Qualcomm
> Dragonboard 410c SBC.
> 
> Signed-off-by: Mike Frampton <mikeframpo@gmail.com>
> ---
>  DEVELOPERS                                    |  3 ++
>  package/Config.in                             |  1 +
>  package/qcom-db410c-firmware/Config.in        |  6 +++
>  .../qcom-db410c-firmware.hash                 |  3 ++
>  .../qcom-db410c-firmware.mk                   | 41 +++++++++++++++++++
>  5 files changed, 54 insertions(+)
>  create mode 100644 package/qcom-db410c-firmware/Config.in
>  create mode 100644 package/qcom-db410c-firmware/qcom-db410c-firmware.hash
>  create mode 100644 package/qcom-db410c-firmware/qcom-db410c-firmware.mk

In fact, I fixed up the minor issues that remained, and applied your
patch to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
