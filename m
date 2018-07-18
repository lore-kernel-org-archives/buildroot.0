From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:47:37 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2018.03
 release
In-Reply-To: <20180625154535.21098-1-didin@synopsys.com> (Evgeniy Didin's
 message of "Mon, 25 Jun 2018 18:45:35 +0300")
References: <20180625154535.21098-1-didin@synopsys.com>
Message-ID: <87d0vkgqrq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Evgeniy" == Evgeniy Didin <Evgeniy.Didin@synopsys.com> writes:

 > This commit finally bumps ARC tools to the most recent arc-2018.03 release version.
 > ARC GNU tools of version arc-2018.03 bring some quite significant changes like:
 > * Binutils v2.29.51 with additional ARC patches
 > * GCC 7.3.1 with additional ARC patches
 > * GDB 8.0.50 with ARC patches

 > More information on this release could be found here:
 > https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2018.03-release

 > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: arc-buildroot at synopsys.com
 > ---
 > Please also apply this patch on top of 2018.05.x branch, so we will have
 > final release version of toolchain instead of release candidate version. 

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
