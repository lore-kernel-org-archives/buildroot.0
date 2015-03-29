From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 15:10:13 +0200
Subject: [Buildroot] [PATCH] gstreamer/gst-plugin-x170: requires the
 Linux kernel
In-Reply-To: <1427609657-9715-1-git-send-email-fabio.porcedda@gmail.com>
References: <1427609657-9715-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150329151013.69859d5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sun, 29 Mar 2015 08:14:17 +0200, Fabio Porcedda wrote:
> Add a missing reverse depency from the on2-8170-libs package.
> 
> Fixes warning:
> warning: (BR2_PACKAGE_GST_PLUGIN_X170) selects BR2_PACKAGE_ON2_8170_LIBS which has unmet direct dependencies (BR2_arm926t && BR2_TOOLCHAIN_USES_GLIBC && BR2_LINUX_KERNEL)
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
