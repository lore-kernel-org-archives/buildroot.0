From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:29:10 +0100
Subject: [Buildroot] [PATCH 04/14] imx-gpu-viv: bump version to 5.0.11
	p7.4
In-Reply-To: <1458140214-22303-5-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 16 Mar 2016 15:56:44 +0100")
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-5-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87lh5f1kuh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > This version is released with 3.14.52-1.1.0_ga release.
 > Includes many of the bug fixes and stability improvements.
 > For more information refer to i.MX Linux Release Notes from NXP website:
 > L3.14.52_1.1.0_LINUX_DOCS package is under Supporting Information.

 > This patch is based on the Yocto equivalent:
 > https://github.com/Freescale/meta-fsl-arm/commit/f1161869

 > This package has been tested with both X11 and Framebuffer backends:
 >  # cd /usr/share/examples/viv_samples/vdk/
 >  # apitrace trace --api egl ./tutorial7
 >  # gmem_info
 >  ... display memory use per PID ...
 >  #?apitrace replay tutorial7.trace
 >  #?eglretrace tutorial7.trace

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
