From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 17:36:32 +0100
Subject: [Buildroot] [PATCH 1/1] configs: beaglebone: update kernel to
 4.1.13 and u-boot to 2015.10
In-Reply-To: <1452653542-5562-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1452653542-5562-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20160308173632.45354249@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoltan, Chris,

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

Any news about this submission? Lots of comments and suggestions have
been made, but no newer version was sent, unless I missed it.

Do you plan to work on this topic soon? IIRC, the biggest issue was
having an overlay-capable DTC.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
