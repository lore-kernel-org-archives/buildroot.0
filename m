From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 22:20:10 +0100
Subject: [Buildroot] [PATCH] configs/zynq_zybo: remove defconfig
In-Reply-To: <CADvTj4oyc=3ThQ++0CcS+wiYuQrc0sB=67aBamPdPiZjYGMv1w@mail.gmail.com>
 (James Hilliard's message of "Fri, 22 Feb 2019 13:54:11 -0700")
References: <20190222204442.4785-1-thomas.petazzoni@bootlin.com>
 <CADvTj4oyc=3ThQ++0CcS+wiYuQrc0sB=67aBamPdPiZjYGMv1w@mail.gmail.com>
Message-ID: <87lg27ikqd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > On Fri, Feb 22, 2019 at 1:44 PM Thomas Petazzoni
 > <thomas.petazzoni@bootlin.com> wrote:
 >> 
 >> This defconfig was added in October 2016 and was never updated since
 >> then. It currently fails to build because U-Boot is too old and
 >> doesn't build with host-openssl in version 1.1.x.
 > You can probably just replace uboot with this version
 > https://github.com/Xilinx/u-boot-xlnx/tree/xilinx-v2018.3 for xilinx
 > devices like these.

Possibly, but if nobody has access to and is interesting in maintaining
this defconfig, then it makes more sense to remove it.

-- 
Bye, Peter Korsgaard
