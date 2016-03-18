From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:29:17 +0100
Subject: [Buildroot] [PATCH 02/14] libfslparser: bump to version 4.0.8
In-Reply-To: <1458140214-22303-3-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 16 Mar 2016 15:56:42 +0100")
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-3-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87h9g31kua.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Changelog since 4.0.7:
 > -Support hevc in MPG2 parser.
 > -Enhance the parsing conditions in SPS nal unit.
 >  Parse system header to get stream id.
 >  For mpeg video, don't call parseh264 to avoid mistakes.
 > -Fix memory leak, free temp data buffer after parsing header.

 > This patch is based on the Yocto equivalent:
 > https://github.com/Freescale/meta-fsl-arm/commit/c3aa06b3

 > This package has been implicitely tested through gstreamer as the 0.10
 > plugin relies on it:
 >  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
