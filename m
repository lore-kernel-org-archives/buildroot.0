From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:31:19 +0100
Subject: [Buildroot] [PATCH 10/14] firmware-imx: bump to version 5.3
In-Reply-To: <1458140214-22303-11-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 16 Mar 2016 15:56:50 +0100")
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-11-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87mvpvzadk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Changelog:
 > - Add basic epdc firmware copy to correct output path
 > - Move legacy epdc firmware to this package out of kernel
 > - VPU firmware upgrade to v3.1.1_r46070

 > This patch is based on the Yocto equivalent:
 > https://github.com/Freescale/meta-fsl-arm/commit/0fdf829

 > This package has been implicitely tested through gstreamer as the
 > plugins rely on them for vpu decoding for instance:
 >  # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
 >    matroskademux ! imxvpudec ! imxipuvideosink

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
