From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 11:31:59 +0200
Subject: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
	efi}_defconfig: unbreak after qemu bump to linux-4.11
In-Reply-To: <20170614213604.10067-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 14 Jun 2017 23:36:04 +0200")
References: <20170614213604.10067-1-peter@korsgaard.com>
Message-ID: <878tktk35c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The pc_x86_64 defconfigs reuse the linux configuration from qemu_x86_64, but
 > they weren't adjusted when this was updated to use linux-4.11 in 28d97609b25
 > (configs/qemu: bump to the latest kernel version), breaking the build.

 > Fix it by also moving them to linux-4.11.x.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
