From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 10:10:26 +0100
Subject: [Buildroot] [PATCH] configs/nitrogen6x_defconfig: remove
 duplicate BR2_PACKAGE_HOST_UBOOT_TOOLS=y
In-Reply-To: <20201222172743.2725308-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 22 Dec 2020 18:27:43 +0100")
References: <20201222172743.2725308-1-romain.naour@gmail.com>
Message-ID: <87r1ngj3b1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The commit [1] added this option a second time.
 > Remove the first occurence.

 > Fixes:
 > configs/nitrogen6x_defconfig:31:warning: override: reassigning to
 > symbol BR2_PACKAGE_HOST_UBOOT_TOOLS

 > [1] 6ea9f662a03e0f4b4a9000a25095b8e6293b07b6

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
