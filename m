From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Mar 2013 16:50:44 +0100
Subject: [Buildroot] Few question about Buildroot from a newbie
In-Reply-To: <513B5338.14142.19AC2F6F@jana1972.centrum.cz>
References: <513B5338.14142.19AC2F6F@jana1972.centrum.cz>
Message-ID: <20130309165044.19f16466@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear jana1972 at centrum.cz,

On Sat, 09 Mar 2013 15:20:24 +0100, jana1972 at centrum.cz wrote:

> 1. I have a Linux MIPS embeded device that I did not design so it uses some utilities and 
> software  and behaves somehow. I would like to make it behave in a little different way. So 
> my idea is to use the hardware but different software. Is it  possible?
> if so, where should I start? Is there any tutorial?

Get the sources of the Linux kernel for your device, rebuilt it, and
build a userspace for it with Buildroot.

> 2.When I build my software using buildroot, how can I upload it  to my embeded device?

It is entirely device-specific, so it absolutely impossible to answer
this question without knowing in detail which device you're targeting.

Beware though that a big number of consumer-grade devices are sometimes
difficult to hack on, and it may be difficult to reflash them with your
own system. It really depends on the device you're targeting.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
