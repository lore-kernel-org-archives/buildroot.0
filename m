From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Sun, 13 Dec 2015 23:51:31 +0100
Subject: [Buildroot] support for device tree overlays ?
Message-ID: <566DF673.50903@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Is there some support yet for device tree overlays ?
So far i used a modified copy of a dts file from the kernel source with 
some additional items enabled,
and some other device tree nodes disabled.
As i understand using overlays would be a cleaner way to adjust the 
device tree to my needs without having
to change existing dts files.
Another advantage is that the device tree overlays can be loaded from 
userspace, no need to recompile and reboot
the kernel.

Best Regards , Johan
