From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:05:01 +0100
Subject: [Buildroot] [PATCH] qemu_riscv64_virt_defconfig: fix linux
 header selection
In-Reply-To: <1548668897-4064-1-git-send-email-gwenj@trabucayre.com> (Gwenhael
 Goavec-Merou's message of "Mon, 28 Jan 2019 10:48:17 +0100")
References: <1548668897-4064-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <87tvhscx36.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

 > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > When the kernel is built by Buildroot BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_X_YY
 > must be used and not BR2_KERNEL_HEADERS_X_YY.

 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
