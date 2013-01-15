From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jan 2013 17:14:13 +0100
Subject: [Buildroot] CANBUs Quesetion
In-Reply-To: <000e01cdf338$69da6150$3d8f23f0$@co.uk>
References: <001b01cdf015$9b34ca40$d19e5ec0$@co.uk>
 <20130111171429.79490168@skate>
 <004501cdf24a$009f6440$01de2cc0$@co.uk>
 <50F40BF3.5080106@relinux.de>
 <004b01cdf26d$ea1d2cb0$be578610$@co.uk>
 <20130114195101.12914c2d@skate>
 <002d01cdf30f$46f45890$d4dd09b0$@co.uk>
 <50F5568C.8060007@relinux.de>
 <000e01cdf338$69da6150$3d8f23f0$@co.uk>
Message-ID: <20130115171413.5d2b64ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ted Wood,

On Tue, 15 Jan 2013 15:53:06 -0000, Ted Wood wrote:

> As for providing driver source code, I really wasn't expecting anyone
> to be prepared to dig around in it. That's supposed to be my job.
> 
> But for what it's worth the source code is at: 
> 
> http://www.peak-system.com/fileadmin/media/linux/index.htm

As I said already, the pcan-usb driver is already part of the mainline
Linux kernel. Why aren't you using this driver, which is already part
of any Linux kernel that you get, and doesn't require any patching or
anything?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
