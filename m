From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Feb 2020 08:34:54 +0100
Subject: [Buildroot] [PATCH v2] toolchain: bump ARC prebuild toolchain
 to arc-2019.09
In-Reply-To: <20200118094923.40679-1-Evgeniy.Didin@synopsys.com> (Evgeniy
 Didin's message of "Sat, 18 Jan 2020 12:49:23 +0300")
References: <20200118094923.40679-1-Evgeniy.Didin@synopsys.com>
Message-ID: <8736atkfs1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Evgeniy" == Evgeniy Didin <Evgeniy.Didin@synopsys.com> writes:

 > Lets update prebuilt ARC toolchain to the most recent arc-2019.09.
 > We are dropping dependency of BR2_ARCH_NEEDS_GCC_AT_LEAST_*
 > as for ARC arch there is no any selection of
 > BR2_ARCH_NEEDS_GCC_AT_LEAST_* option.

 > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: arc-buildroot at synopsys.com
 > ---
 > Changes since v1:
 > -Drop dependency of BR2_ARCH_NEEDS_GCC_AT_LEAST_*

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
