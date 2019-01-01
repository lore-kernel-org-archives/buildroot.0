From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jan 2019 21:11:12 +0100
Subject: [Buildroot] [PATCH 3/4] package/opusfile: bump to version 0.11
In-Reply-To: <20190101143702.2736-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 1 Jan 2019 15:37:01 +0100")
References: <20190101143702.2736-1-thomas.petazzoni@bootlin.com>
 <20190101143702.2736-3-thomas.petazzoni@bootlin.com>
Message-ID: <87a7kkqgtb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Changes since the v0.10 release:
 > - Fix two potential integer overflows. (These were not
 >   security-critical unless the compiler took the opportunity provided
 >   by the undefined behavior to format your hard drive.)
 > - Allow JPEGs in METADATA_BLOCK_PICTURE tags to include EXIF data.
 > - A few warning fixes for gcc 8.
 > - Make opus_tags_copy return OP_EFAULT on failure instead of returning
 >   success.
 > - Various integration and testing environment improvements.

 > This release is backward-compatible with the previous release. We
 > recommend all users upgrade.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
