From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:43:13 +0200
Subject: [Buildroot] [PATCH] imx_usb_loader: Allow target build
In-Reply-To: <1526462165-1544-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1526462165-1544-1-git-send-email-vincent.prince.fr@gmail.com>
Message-ID: <20180519224313.6ffe9ce2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 May 2018 11:16:05 +0200, Vincent Prince wrote:
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> ---
>  package/Config.in                        |  1 +
>  package/imx-usb-loader/Config.in         | 10 ++++++++++
>  package/imx-usb-loader/imx-usb-loader.mk |  8 ++++++++
>  3 files changed, 19 insertions(+)
>  create mode 100644 package/imx-usb-loader/Config.in

I've applied to next, after doing the following changes:

    [Thomas:
     - improve commit log
     - fix indentation
     - drop BR2_arm dependency
     - add missing host-pkgconf dependency
     - fix prefix variable to install in $(TARGET_DIR)/usr]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
