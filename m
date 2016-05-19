From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 May 2016 21:13:08 +0200
Subject: [Buildroot] [PATCH] toolchain: bump ARC tools to arc-2016.03
	release
In-Reply-To: <1463606806-5676-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Thu, 19 May 2016 00:26:46 +0300")
References: <1463606806-5676-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87zirlamkb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > This change switches ARC tools to the most recent arc-2016.03
 > version.

 > ARC GNU tools of version arc-2016.03 bring some quite significant
 > changes like:
 >  * Binutils v2.26+ (upstream commit id 202ac19 with additional ARC
 >  * patches)
 >  * GCC v4.8.5
 >  * GDB 7.10

 > More about changes, improvements and fixes could be found here:
 > https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2016.03

 > Note in this change we're adding sha512 checksums for
 > both binutils and gcc tarballs fetched from GitHub.

 > Build and run-tested in nSIM for both ARC700 and ARC HS38.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed to next, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
