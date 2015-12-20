From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:37:29 +0100
Subject: [Buildroot] buildroot support for OrangePI PC
In-Reply-To: <6b87.5675ed98.926d4@xdna.net>
References: <08485173-6FC7-42EF-9BFE-7B3B9967EEC0@xiot.nl>
 <6b87.5675ed98.926d4@xdna.net>
Message-ID: <20151220133729.10e6021e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Dec 2015 23:51:52 -0000, Cam Hutchison wrote:

> I'll be embarking on this in the new year (OrangePi Plus too). I plan is
> to come up with two defconfigs - one for the 3.4 kernel which supports
> the hardware ok but has a lot of code that is not mainlined and has a
> custom build process, and one for mainline which currently has limited
> support for the H3 and Orange Pi (although there is current activity so
> I'll also track the linux-sunxi kernel too).

Note that we already have such a dual defconfig situation with the
Olimex A20 Olinuxino, with olimex_a20_olinuxino_lime_defconfig using
the mainline kernel, and olimex_a20_olinuxino_lime_mali_defconfig using
the 3.4 sunxi kernel. So I guess we can do the same for other platforms
if needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
