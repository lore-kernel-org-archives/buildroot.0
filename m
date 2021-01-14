From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 14:37:53 +0100
Subject: [Buildroot] Support for BCM953012HR board?
In-Reply-To: <1610587332564-0.post@n4.nabble.com>
References: <1610587332564-0.post@n4.nabble.com>
Message-ID: <20210114143753.3591a3a5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jan 2021 19:22:12 -0600 (CST)
scdrj <scdrjcom@gmail.com> wrote:

> How do I build the images for BCM953012HR (Broadcom Northstar Reference
> board)?

You need to create a Buildroot configuration that matches your
platform, i.e that defines the target CPU, the Linux kernel version and
configuration, the filesystem image format you need, etc. Once this
configuration is defined (which is obviously the difficult part), build
it with "make" and enjoy the build results in output/images/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
