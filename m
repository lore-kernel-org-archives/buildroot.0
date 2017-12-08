From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 13:35:31 +0100
Subject: [Buildroot] [PATCH 2/8] arm-trusted-firmware: add
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
In-Reply-To: <20171203214811.3124-3-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Dec 2017 22:48:05 +0100")
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-3-thomas.petazzoni@free-electrons.com>
Message-ID: <874lp11jos.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > ATF can be used in different ways:
 >  - ATF encapsulates U-Boot as the BL33, which is what is done on ARM
 >    Juno (currently supported in Buildroot) and Marvell platforms (soon
 >    to be supported)

 >  - U-Boot encapsulates ATF's BL31, which is what is done on Allwinner
 >    ARM64 platforms.

 > Until now we were assumming the former was always the case, but
 > obviously it isn't. Therefore, this patch adds an option that allows
 > to explicitly tell ATF that it encapsulates U-Boot as its BL33.

 > We adapt the only defconfig that uses ATF so that it enables this
 > option as appropriate.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
