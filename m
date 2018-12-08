From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 20:57:08 +0100
Subject: [Buildroot] [PATCH 2/2] package/gcc: remove arm soft patch
In-Reply-To: <20181208190619.9977-2-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 8 Dec 2018 20:06:19 +0100")
References: <20181208190619.9977-1-romain.naour@gmail.com>
 <20181208190619.9977-2-romain.naour@gmail.com>
Message-ID: <8736r74wrv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The patch refers to [1] which says "Unfortuantely, arm-gcc defaults to
 > generating code for armv5t." Since we always explicitly pass the target
 > CPU for ARM, the default CPU shouldn't matter.

 > As suggested by Arnout [2], a test based on qemu_arm_versatile_defconfig
 > has been done without this patch and there is no regression.

 > [1] https://sourceware.org/ml/crossgcc/2008-05/msg00009.html
 > [2] http://lists.busybox.net/pipermail/buildroot/2018-May/222104.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
