From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 22:19:24 +0100
Subject: [Buildroot] [PATCH] configs/zynq_zybo: remove defconfig
In-Reply-To: <20190222204442.4785-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 22 Feb 2019 21:44:42 +0100")
References: <20190222204442.4785-1-thomas.petazzoni@bootlin.com>
Message-ID: <87pnrjikrn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This defconfig was added in October 2016 and was never updated since
 > then. It currently fails to build because U-Boot is too old and
 > doesn't build with host-openssl in version 1.1.x.

 > On February 13, 2019, the original submitter was notified, but didn't
 > reply, so let's remove the defconfig for this platform.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/165766194

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
