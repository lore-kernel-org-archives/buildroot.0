From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 21:16:08 +0100
Subject: [Buildroot] [PATCH 1/2] Revert
 "configs/qemu_arm_versatile_defconfig: increase SD card image size to
 64MiB"
In-Reply-To: <20201108152736.2956555-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 8 Nov 2020 16:27:35 +0100")
References: <20201108152736.2956555-1-romain.naour@gmail.com>
Message-ID: <87wnytnf1z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > qemu_arm_versatile doesn't use SD card interface but SCSI, so there is no
 > need to increase the image size.
 > The change was for qemu_arm_vexpress_defconfig instead (notice the
 > name of the defconfig used in gitlab).

 > This reverts commit cb62a8e0a2b88b6c1b3ffe74e9eb370bf686fa62.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
