From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:24:11 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-good: enable jack plugins if
 jack2 is on
In-Reply-To: <1535055485-8704-1-git-send-email-brad@nextdimension.cc>
References: <1535055485-8704-1-git-send-email-brad@nextdimension.cc>
Message-ID: <20180824232411.4d01043d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Brad,

On Thu, 23 Aug 2018 15:18:05 -0500, Brad Love wrote:
> Jack2 audio server is part of buildroot, but the jack gst plugins
> are disabled completely in gst1-plugins-good, whether or not jack2
> is selected. This changes the logic to where if the build system
> determines jack2 audio server is selected, then the jack plugins are
> enabled. If the plugins are enabled, then jack2 is also added as a
> dependency to gst1-plugins-good.
> 
> 
> Signed-off-by: Brad Love <brad@nextdimension.cc>
> ---
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
