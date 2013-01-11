From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jan 2013 17:14:29 +0100
Subject: [Buildroot] CANBUs Quesetion
In-Reply-To: <001b01cdf015$9b34ca40$d19e5ec0$@co.uk>
References: <001b01cdf015$9b34ca40$d19e5ec0$@co.uk>
Message-ID: <20130111171429.79490168@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ted Wood,

On Fri, 11 Jan 2013 16:06:23 -0000, Ted Wood wrote:
> I have a  PCAN104 board, which is supplied with open source Linux drivers.
> 
> I have built my kernel with CAN support.
> 
> How do I incorporate the PCAN drivers into my Linux kernel build?

What is PCAN ? Is it a family of hardware ? Without more details, hard
to help you.

To see the CAN hardware drivers available in your kernel, go in:

	Networking support
	 -> CAN bus subsystem support
	    -> CAN Device Drivers

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
