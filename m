From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 07 May 2015 10:13:56 +0200
Subject: [Buildroot] Proposal to remove patches from patchwork,
	or find adopters
In-Reply-To: <20150506235353.7740a9d3@free-electrons.com>
References: <20150506235353.7740a9d3@free-electrons.com>
Message-ID: <3636354.fxv6q18u86@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wednesday 06 May 2015 23:53:53 Thomas Petazzoni wrote:
[...]
> Volunteers interested in adopting one or several of the below patches,
> please speak up.
> 
> Here is the list of such patches:
> 
[...]
>  * [1/2] Use package framework to manage skeleton
>  * [2/2] Change deps between $(TARGET_DIRS) and rootfs-dirs
IMHO, they continue to make sense. I will respin and resend.

[...]
>  * [RFC,3/4] opengl-registry: Also provide DRI interface
>  * [RFC,4/4] xorg-server: Depends on libgl to enable DRI/GLX
These 2 ones was based on opengl-registry. This package was replaced by
mesa3d-headers. However, I think there is something to do on this 
subject. I mark the first as Not-Applicable and the second as Change 
Request. I will rework them.

[...]

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
