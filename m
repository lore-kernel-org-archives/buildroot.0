From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:59:36 +0100
Subject: [Buildroot] [PATCH 12/14] gst1-imx: add missing libfslcodec
	dependency
In-Reply-To: <1458140214-22303-13-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-13-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160319145936.13a7ebed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Wed, 16 Mar 2016 15:56:52 +0100, Gary Bisson wrote:
> Needed by imxmp3audioenc and imxuniaudiodec plugins.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/gstreamer1/gst1-imx/gst1-imx.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
