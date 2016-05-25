From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2016 14:35:38 +0200
Subject: [Buildroot] [PATCH 1/1] configs: beaglebone: update kernel to
 4.1.13 and u-boot to 2015.10
In-Reply-To: <1452653542-5562-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1452653542-5562-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20160525143538.2f7944fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jan 2016 03:52:22 +0100, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
> 
> This patch is basically the cleaned-up version of Chris LaRocque's patch
> from his mail
> "[PATCH 1/2] Updated the Beaglebone configuration, 01/03/2016 10:01 PM"
> and the cleanup followed Arnout's corresponding answers.
> Changes to Chris' patches:
> * dtc patches fetched from GH and placed in 'board/beaglebone/patches/dtc'
> * BR2_GLOBAL_PATCH_DIR set accordingly
> * added seperated kernel defconfig instead of patching the upstream defconfig
> * cleanups in uEnv.txt
> * fix u-boot version to 2015.10
> 
> The heavy-lifting was done by Chris here, the rest is mostly cosmetics. If
> anything els seems to be tweaked, please let us know.

This patch has received many comments, but as far as I know, no new
version has been sent. I still believe that an updated
beaglebone_defconfig would be very nice to have, so if someone could
revive this effort, it would be good.

In the mean time, I'm marking this patch as "Changes Requested" in our
patch tracking system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
