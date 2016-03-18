From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:29:04 +0100
Subject: [Buildroot] [PATCH 01/14] libfslcodec: bump to version 4.0.8
In-Reply-To: <1458140214-22303-2-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 16 Mar 2016 15:56:41 +0100")
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-2-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87pour1kun.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Changelog since 4.0.7:
 > - Version alignment with other Multimedia components.

 > This patch is based on the Yocto equivalent:
 > https://github.com/Freescale/meta-fsl-arm/commit/6a1f559a

 > This package has been implicitely tested through gstreamer as the 0.10
 > plugin relies on it:
 >  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
