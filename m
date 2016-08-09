From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:44:21 +0200
Subject: [Buildroot] [PATCH] gst1-imx: fix V4L2 plugin build with kernel
 headers < 3.18
In-Reply-To: <1470748903-16615-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1470748903-16615-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160809154421.580a578a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 15:21:43 +0200, Gary Bisson wrote:
> This patch fix the following build issue:
> http://autobuild.buildroot.net/results/b46/b460a770c8f4e992d29dde8fe37fc23a949937f2
> 
> It has been submitted to the package maintainers:
> https://github.com/Freescale/gstreamer-imx/pull/106
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  ...1-v4l2src-Add-V4L2_PIX_FMT_XRGB555X-check.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/gstreamer1/gst1-imx/0001-v4l2src-Add-V4L2_PIX_FMT_XRGB555X-check.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
