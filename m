From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Jun 2020 10:49:35 -0300
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/firmware-imx:
 install sdma firmware for i.MX8M{, M, N}
In-Reply-To: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
References: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
Message-ID: <CAOMZO5ABSEJvLkBJGNUtoSgZoBCEZAqkGqLv7wVuffE57zJq+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?bastien,

On Mon, Jun 15, 2020 at 10:44 AM S?bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:

> -FIRMWARE_IMX_BLOBS = sdma vpu
> +FIRMWARE_IMX_BLOBS = sdma epdc

The commit log does not mention about removing the VPU firmware and
adding the EPDC one.

What is the reason for not installing the VPU firmware?
