From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 09:49:40 +0100
Subject: [Buildroot] [PATCH 1/3] board/technologic/ts5x00: bump kernel
 to 4.14
In-Reply-To: <20180305171505.4003-2-vivien.didelot@savoirfairelinux.com>
 (Vivien Didelot's message of "Mon, 5 Mar 2018 12:15:03 -0500")
References: <20180305171505.4003-1-vivien.didelot@savoirfairelinux.com>
 <20180305171505.4003-2-vivien.didelot@savoirfairelinux.com>
Message-ID: <876063809n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vivien" == Vivien Didelot <vivien.didelot@savoirfairelinux.com> writes:

 > Bump the 3.17 kernel used for the Technologic Systems TS-5500 platform
 > to the latest LTS kernel 4.14.

 > This fixes the ts5x00_defconfig build with GCC 6.x.

 > The linux-3.17.config file has been renamed to linux-4.14.config to
 > match the new kernel version, and its changes are the result of make
 > linux-update-defconfig. However only comments are affected.

 > Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

 > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.8"
 > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"

Any specific reason you are not using the latest stable, E.G. 4.14.25?

Anyway, that can be fixed later if needed - Committed, thanks.

-- 
Bye, Peter Korsgaard
