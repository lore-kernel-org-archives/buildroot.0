From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:29:23 +0100
Subject: [Buildroot] [PATCH 03/14] libfslvpuwrap: bump to version 1.0.62
In-Reply-To: <1458140214-22303-4-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 16 Mar 2016 15:56:43 +0100")
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-4-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87d1qr1ku4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Changelog:
 > - Add frame rate check and return failure if frame rate is invalid
 >   value (<=0)

 > This patch is based on the Yocto equivalent:
 > https://github.com/Freescale/meta-fsl-arm/commit/67b3b998

 > This package has been implicitely tested through gstreamer as the
 > plugins rely on it for vpu decoding:
 >  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
