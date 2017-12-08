From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 13:34:56 +0100
Subject: [Buildroot] [PATCH 1/8] arm-trusted-firmware: add option to
 enable/disable building FIP image
In-Reply-To: <20171203214811.3124-2-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Dec 2017 22:48:04 +0100")
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-2-thomas.petazzoni@free-electrons.com>
Message-ID: <878ted1jpr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Currently, our arm-trusted-firmware unconditionally builds a FIP
 > (Firmware Image Package). While this is often needed on platforms
 > where ATF encapsulates U-Boot, it is not the case on some other
 > platforms where it's U-Boot that encapsulates parts of ATF.

 > In order to prepare the support for the later platforms, we make
 > building the FIP image optional, and update the only defconfig we have
 > that uses ARM Trusted Firmware.

 > Note: we considered adding a "default y" here to preserve backward
 > compatibility, but there really isn't any default that is sane:
 > whether a FIP image needs to be built or not is purely platform
 > specific.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
