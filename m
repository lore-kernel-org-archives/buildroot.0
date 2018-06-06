From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 22:12:43 +0200
Subject: [Buildroot] [PATCH] imx-usb-loader: propagate libusb dependency
In-Reply-To: <41228b9c0becd39927b2f2714e8e980a372c319d.1528315479.git.baruch@tkos.co.il>
References: <41228b9c0becd39927b2f2714e8e980a372c319d.1528315479.git.baruch@tkos.co.il>
Message-ID: <20180606221243.2555b064@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Jun 2018 23:04:39 +0300, Baruch Siach wrote:
> Avoid select of libusb when the toolchain does not support threads.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a21/a212ee3e5ec174f4e6e7d582f777325dac035bfd/
> 
> Cc: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/imx-usb-loader/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

I'm wondering how I could have missed that during the review. Thanks
for pointing it out and proposing a patch to fix it! Applied!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
