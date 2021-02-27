From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:05:32 +0100
Subject: [Buildroot] [PATCH] support/scripts/boot-qemu-image.py: pexpect
 must throw an exception when a timeout occurs
In-Reply-To: <20210220165604.11929-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 20 Feb 2021 17:56:04 +0100")
References: <20210220165604.11929-1-romain.naour@gmail.com>
Message-ID: <87eeh1s7wz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As reported on IRC by sephthir, the gitlab test of the defconfig
 > qemu_sparc_ss10_defconfig doesn't error out while the system
 > is not working properly.

 > This is due to pexpect doesn't throw an exception when a
 > timout occurs and continue to the next command.

 > Remove "pexpect.TIMEOUT" to get the expected behaviour.

 > The qemu_sparc_ss10_defconfig is already fixed by
 > 4d16e6f5324f0285f51bfbb5a3503584f3b3ad12.

 > This was reported to gcc upstream:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
