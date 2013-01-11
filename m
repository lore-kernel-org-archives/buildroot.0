From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jan 2013 17:16:20 +0100
Subject: [Buildroot] CANBUs Quesetion
In-Reply-To: <20130111171429.79490168@skate>
References: <001b01cdf015$9b34ca40$d19e5ec0$@co.uk>
 <20130111171429.79490168@skate>
Message-ID: <20130111171620.2ab18a76@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 11 Jan 2013 17:14:29 +0100, Thomas Petazzoni wrote:

> What is PCAN ? Is it a family of hardware ? Without more details, hard
> to help you.

Ok, after a bit of googling (I should also do my homework before
replying too fast), I guess you're talking about
http://www.phytec.com/products/can/pc-can-interfaces/peakusb.html.

So, it's known in the kernel as peak_usb, driver in
drivers/net/can/usb/peak_usb. Config option to enable is
CONFIG_CAN_PEAK_USB.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
