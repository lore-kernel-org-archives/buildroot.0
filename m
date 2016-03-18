From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:31:14 +0100
Subject: [Buildroot] [PATCH 09/14] imx-vpu: bump to version 5.4.32
In-Reply-To: <1458140214-22303-10-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 16 Mar 2016 15:56:49 +0100")
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-10-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87r3f7zadp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Changelog:
 > - Support AVcVuiInfo for Decoder through DecInitialInfo or DecOutputInfo
 > - Clear structure iram IOGetIramBase() fails to set them to avoid
 > using uninitialized variables.

 > This patch is based on the Yocto equivalent:
 > https://github.com/Freescale/meta-fsl-arm/commit/be030922

 > This package has been implicitely tested through gstreamer as the
 > plugins rely on it for vpu decoding:
 >  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
 >  # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 >  # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
 >    matroskademux ! imxvpudec ! imxipuvideosink

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
