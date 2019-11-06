From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Nov 2019 15:48:28 +0100
Subject: [Buildroot] [PATCH] toolchain: bump ARC tools to arc-2019.09-rc1
In-Reply-To: <20191106130309.37957-1-Evgeniy.Didin@synopsys.com> (Evgeniy
 Didin's message of "Wed, 6 Nov 2019 16:03:09 +0300")
References: <20191106130309.37957-1-Evgeniy.Didin@synopsys.com>
Message-ID: <874kzhdps3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Evgeniy" == Evgeniy Didin <Evgeniy.Didin@synopsys.com> writes:

 > This commit bumps ARC toolchain to arc-2019.09-rc1.
 > We want to test how new toolchain-rc1 builds packages,
 > so we can make fixes before release of toolcain.

 > ARC GNU tools of version arc-2019.09-rc1 bring some quite significant changes like:
 > * Binutils v2_33.20191002 with additional ARC patches
 > * GCC 9.2.0 with additional ARC patches
 > * glibc 2.30 with additional ARC patches

 > Please note that it is a release candidate and it might contain some breakages,
 > please don't use it for production builds.

 > Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: arc-buildroot at synopsys.com
 > ---
 > Please apply this commit to master branch because
 > we already have arc-2019.09-eng002 toolchain in 2019.11-rc1
 > but rc1 should be more stable.

Committed, thanks.

-- 
Bye, Peter Korsgaard
