From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:42:23 +0100
Subject: [Buildroot] [PATCH 09/10] gst1-plugins-bad: add install to
 staging directory
In-Reply-To: <1454154357-31625-10-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-10-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160201214223.78963f61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sat, 30 Jan 2016 12:45:56 +0100, Gary Bisson wrote:
> gst1-imx package links against libgstphotography for its imxv4l2src
> plugin.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
