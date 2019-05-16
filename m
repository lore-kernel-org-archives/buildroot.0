From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 May 2019 08:56:47 +0200
Subject: [Buildroot] Orange pi zero:  i2c is not under /dev
In-Reply-To: <1557988831153-0.post@n4.nabble.com>
References: <1557981319043-0.post@n4.nabble.com>
 <20190516080159.6d844d12@windsurf>
 <1557988831153-0.post@n4.nabble.com>
Message-ID: <20190516085647.7a861d60@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 May 2019 01:40:31 -0500 (CDT)
muhammet <mk61@hotmail.com> wrote:

> I enabled it as a module and directly. But the result didn't change. I am
> new to buildroot and embedded systems. I don't know what and where to look.

Then you don't have any I2C bus enabled on your platform perhaps ?
Check what you have in /sys/bus/i2c/devices/.

But your question really isn't Buildroot related at all at this point,
I'm afraid.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
