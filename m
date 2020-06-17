From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 23:00:59 +0200
Subject: [Buildroot] [PATCH 1/1] imx-usb-loader: bump version to 30b43d6
In-Reply-To: <20200615133735.12926-1-sebastien.szymanski@armadeus.com>
References: <20200615133735.12926-1-sebastien.szymanski@armadeus.com>
Message-ID: <20200617230059.53caab40@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jun 2020 15:37:35 +0200
S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:

> Bump version to get i.MX8M Nano support.
> 
> Changes sinces 4aa9809:
> 
>   30b43d6 (HEAD -> master, origin/master, origin/HEAD) Fix MinGW Build (#114)
>   25d6c0d mx8m_usb_sdp_spl: create generic sdp spl config for all imx8m
>   dc0fb26 mx8mn_usb_sdp_spl.conf: initial addition
>   f009770 imx_sdp: don't try to load hdmi firmware
>   c5c4d28 add SPDS protocol support, imx8mn(nano)
>   15dbbd7 tests: add pid 0x1001
>   353791c tests: add pids 0x0134/0x1000
>   06fb581 tests: pid=0x0080 is for mx6ull
>   6b07a0a mx8mm_usb_sdp_spl.conf/ mx8mm_usb_work.conf: s/imx-mkimage/u-boot-imx6/
>   b00b0e2 mx8mq_usb_work.conf: load flash.bin from u-boot-imx6 directory
>   bda7ab6 add mx8mq_usb_sdp_spl.conf
>   7984efc Moving libusb_free_device_list to get imx_usb to work on Windows.
>   29fa8ab imx_usb: use device found by find_imx_device
>   abe7f5d add support for relocatable installs
>   3d36c83 Fixed build for Visual Studio 2015 Express.
>   fe50624 imx_usb.config: add mx8mm_usb_sdp_spl.conf/mx8mm_usb_work.conf lines
>   f7752f4 mx8mq_usb_work.conf: use bl31-iMX8MQ-2g.bin to match branch boundary-imx_4.9.123_imx8mm_ga of imx-mkimage
>   8c9eee7 add mx8mm config files
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/imx-usb-loader/imx-usb-loader.hash | 2 +-
>  package/imx-usb-loader/imx-usb-loader.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. Note: "package/" prefix was missing in the
commit title, I fixed that when applying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
