From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 May 2019 08:01:59 +0200
Subject: [Buildroot] Orange pi zero:  i2c is not under /dev
In-Reply-To: <1557981319043-0.post@n4.nabble.com>
References: <1557981319043-0.post@n4.nabble.com>
Message-ID: <20190516080159.6d844d12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 May 2019 23:35:19 -0500 (CDT)
muhammet <mk61@hotmail.com> wrote:

> Hi I am working with Orange pi zero. Although I enable i2c-tools under make
> menuconfig and i2c support under make linux-menuconfig when I use i2cdetect
> -y 0 I get the error below.I am stuck at that point. I want to use i2c bus
> to use my imu sensor. Please help me.
> 
> Error: Could not open file `/dev/i2c-0' or `/dev/i2c/0': No such file or
> directory

Make sure CONFIG_I2C_CHARDEV is enabled in your kernel configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
