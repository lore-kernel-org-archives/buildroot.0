From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jan 2013 12:36:09 +0100
Subject: [Buildroot] CANBUs Quesetion
In-Reply-To: <004501cdf24a$009f6440$01de2cc0$@co.uk>
References: <001b01cdf015$9b34ca40$d19e5ec0$@co.uk>
 <20130111171429.79490168@skate>
 <004501cdf24a$009f6440$01de2cc0$@co.uk>
Message-ID: <20130114123609.026e407c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ted Wood,

On Mon, 14 Jan 2013 11:26:30 -0000, Ted Wood wrote:

> OK. I'll rephrase my original question...
> 
> I have an  XXX CPU Board. I have fitted a YYY I/O board to it, which is
> supplied with open source Linux drivers.
> How do I incorporate the YYY drivers into my Linux kernel build?

Depends on your definitions of XXX and YYY. But generally speaking, you
need to adjust your Linux kernel configuration. So, in the context of
Buildroot:

	make linux-menuconfig

See also
http://buildroot.org/downloads/manual/manual.html#kernel-custom.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
