From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:40:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/armbian-firmware: bump version
 to 70a0850
In-Reply-To: <1600317805.28526.3.camel@aliyun.com>
References: <1600317805.28526.3.camel@aliyun.com>
Message-ID: <20200917214021.3f0f9402@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Sep 2020 12:43:25 +0800
Tian Yuanhao via buildroot <buildroot@busybox.net> wrote:

> Add an option for AP6256, which is used on ROCK Pi 4.
> 
> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
> ---
> ?package/armbian-firmware/Config.in?????????????|??5 +++++
> ?package/armbian-firmware/armbian-firmware.hash |??2 +-
> ?package/armbian-firmware/armbian-firmware.mk???| 10 +++++++++-
> ?3 files changed, 15 insertions(+), 2 deletions(-)

Thanks, I've applied, after splitting the commit into two separate
changes: one doing the version bump, one adding support for the AP6256
firmware.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
