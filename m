From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sun, 05 Apr 2015 11:10:53 +0200
Subject: [Buildroot] [RFC 2/4] gpu-viv-bin-mx6q: is a libgl provider
In-Reply-To: <20150404184803.31434bd7@free-electrons.com>
References: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
 <1421839408-15839-3-git-send-email-jezz@sysmic.org>
 <20150404184803.31434bd7@free-electrons.com>
Message-ID: <3078796.2A5JP7VBLH@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Saturday 04 April 2015 18:48:03 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Wed, 21 Jan 2015 12:23:26 +0100, J?r?me Pouiller wrote:
> 
> > -GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
> > +GPU_VIV_BIN_MX6Q_DEPENDENCIES = opengl-registry
> > +GPU_VIV_BIN_MX6Q_PROVIDES = libgl libegl libgles libopenvg
> >  GPU_VIV_BIN_MX6Q_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT))
> 
> In the end, opengl-registry was never added, we preferred using the
> mesa3d headers instead, through the mesa3d-headers package.
> 
> Can you respin this patch and resend a new version accordingly?
This task is in my todo list for some months. I increase its priority.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
