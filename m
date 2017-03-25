From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:36:16 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: Add missing firmware
 for the carl9170 driver.
In-Reply-To: <20170322123641.19482-1-kp@tec4data.at>
References: <20170322123641.19482-1-kp@tec4data.at>
Message-ID: <20170325153616.6fc536f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 13:36:41 +0100, Karoly Pados wrote:
> For a long time now Atheros USB AR9170 devices have been using the
> carl9170 driver which relies on the carl9170-1.fw firmware file.
> This firmware is built by current buildroot, but its output
> is not copied to the resulting rootfs. This patch fixes that.

Firmware files are not "built by Buildroot", since they are only
provided as binary-only files. Buildroot merely installs them, so I've
fixed up the commit log before applying.

> Please backport to 2017.02.x branch.

So you're using the LTS branch for some projects?

Peter: as requested by Karoly, I think we can backport this patch into
the LTS branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
