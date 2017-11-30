From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 14:57:38 +0100
Subject: [Buildroot] [PATCH][NEXT] gst1-imx: add missing dependency for
 imxv4l2videosink plugin
In-Reply-To: <20171130134705.hh3vk4vfgvidl7l2@t450s.lan>
References: <20171130111122.7774-1-gary.bisson@boundarydevices.com>
 <20171130134154.75c9d523@windsurf.home>
 <20171130134705.hh3vk4vfgvidl7l2@t450s.lan>
Message-ID: <20171130145738.52f660a9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 14:47:05 +0100, Gary Bisson wrote:

> > Thanks! However you need to add the corresponding Config.in comment.  
> 
> Is a simple mention of the macro sufficient?
> 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 # V4L2_COLORSPACE_DEFAULT
> 
> Or would rather have a full sentence above the 'depends'?

I'm talking about a Config.in comment, i.e

comment "feature foobaz needs kernel headers >= 4.2"
	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
