From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Sep 2015 14:17:45 +0200
Subject: [Buildroot] [PATCH 09/14] gst-fsl-plugins: bump version to 4.0.3
In-Reply-To: <1441830063-8190-10-git-send-email-gary.bisson@boundarydevices.com>
References: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
 <1441830063-8190-10-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20150910141745.5af8e0bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary,

On Wed,  9 Sep 2015 22:20:58 +0200, Gary Bisson wrote:

> Quick comment on this one, I might delete this package during next cycle
> as it is not maintained any more and has been removed from Yocto:
> https://github.com/Freescale/meta-fsl-arm/commit/83b240e
> 
> Let me know your thoughts on this.

GStreamer 0.10.x is anyway no longer being developed, I'm not sure it's
really being maintained anymore either. We're keeping it in Buildroot
for those people who are using platforms that don't have GStreamer 1.x
plugins, or who have applications written with the GStreamer 0.10.x
API.

We will have to decide at some point to mark GStreamer 0.10 as
deprecated. Not sure when will be the right, I'm not a GStreamer user
personally, so I don't know until when we should support 0.10.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
