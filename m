From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 14:12:59 +0200
Subject: [Buildroot] [PATCH 4/6] configs/odroidc2: remove the defconfig
In-Reply-To: <20190802130937.12591-4-romain.naour@smile.fr> (Romain Naour's
 message of "Fri, 2 Aug 2019 15:09:34 +0200")
References: <20190802130937.12591-1-romain.naour@smile.fr>
 <20190802130937.12591-4-romain.naour@smile.fr>
Message-ID: <87y3091644.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > The odroidc2 defconfig is using gcc 4.9 version in order to build
 > uboot (2015.01) and kernel (3.14.79) for the board.

 > We are going to remove gcc 4.9 version in Buildroot and this
 > defconfig is the only remaining one using this version.

 > Since we don't have the board, we can't update the defconfig with
 > newer bootloader and kernel version.

 > A new defconfig for the odroidc2 board are welcome as soon as
 > it use a newer uboot and kernel version.

 > Remove the defconfig from the gitlab yaml.

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Dagg Stompler <daggs@gmx.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
