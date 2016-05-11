From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 May 2016 23:08:37 +0200
Subject: [Buildroot] [PATCH] toolchain: bump ARC tools to arc-2016.03-rc2
In-Reply-To: <1462914304-24813-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Wed, 11 May 2016 00:05:04 +0300")
References: <1462914304-24813-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87possi9pm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > This change switches ARC tools to RC2 of the most recent arc-2016.03
 > version.

 > Essentially once final release is ready version will be bumped again.

 > ARC GNU tools of version arc-2016.03 bring some quite significant
 > changes like:
 >  * Binutils v2.26+ (upstream commit id 202ac19 with additional ARC patches)
 >  * GCC v4.8.5
 >  * GDB 7.10

 > More about changes, improvements and fixes could be found here:
 > https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2016.03-rc2

 > Also in this change we realign custom Buildroot patches for binutils and
 > gcc for ARC tools. Looks like earlier most of arch-independent patches
 > for binutils and gcc were either unintentionally removed or not even
 > added in patch folders for ARC's binutils and gcc. Now arch-independent
 > patches for binutils-2.26 and gcc-4.8.5 were added in
 > package/{binutils|gcc}/arc-2016.03-rc2 folders.

 > Build and run-tested in nSIM for both ARC700 and ARC HS38.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
