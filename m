From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Apr 2020 00:25:55 +0200
Subject: [Buildroot] [PATCH 2/2] linux: adjust
 BR2_LINUX_KERNEL_IMAGE_NAME help text
In-Reply-To: <20200402214549.2977215-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 2 Apr 2020 23:45:49 +0200")
References: <20200402214549.2977215-1-thomas.petazzoni@bootlin.com>
 <20200402214549.2977215-2-thomas.petazzoni@bootlin.com>
Message-ID: <87369l7cek.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The help text of BR2_LINUX_KERNEL_IMAGE_NAME is somewhat incomplete,
 > in the sense that it assumes just a filename can be passed, while it
 > can be a relative path, such as 'compressed/vmlinux.bin.z'. So make it
 > clear that such paths are relative to arch/ARCH/boot/.

 > Also, drop the part about this being only useful for Xtensa as this is
 > not true: on MIPS it might be needed as well for some specific image
 > types.

 > Reported-by: Paul Cercueil <paul@crapouillou.net>
 > Cc: Paul Cercueil <paul@crapouillou.net>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
