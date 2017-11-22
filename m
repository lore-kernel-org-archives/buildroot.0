From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:30:09 +0100
Subject: [Buildroot] [PATCH][next] gst1-imx: fix v4l2 plugins disable
 options
In-Reply-To: <20171121152706.17883-1-gary.bisson@boundarydevices.com>
References: <20171121152706.17883-1-gary.bisson@boundarydevices.com>
Message-ID: <20171122213009.5fcf61f5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Nov 2017 16:27:06 +0100, Gary Bisson wrote:
> Latest bump to v0.13.0 didn't take care of the following commit:
> 7bfbf71 v4l2: Rename to v4l2video and add switches to enable/disable
>  sink/source
> 
> Updating options to match the new naming of the V4L2 plugins.
> 
> Fixes http://autobuild.buildroot.net/results/5c404a2a28a4052056e5c9a7edda40641fe55f9e
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi,

After screwing up by applying it to master, I finally applied it to
next, after reworking a bit the commit log to be more specific.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
