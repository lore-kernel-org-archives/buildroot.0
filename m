From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 12:32:44 +0100
Subject: [Buildroot] [PATCH] configs/qemu_nios2: add custom kernel
	headers version
In-Reply-To: <20170207093409.3475-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 7 Feb 2017 10:34:09 +0100")
References: <20170207093409.3475-1-romain.naour@gmail.com>
Message-ID: <87inomtew3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > When this qemu nios2 defconfig has been added, the insternal toolchain
 > used for testing was build with Linux kernel headers 4.9, so
 > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9 was missing in the defconfig.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
