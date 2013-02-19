From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Feb 2013 23:32:04 +0100
Subject: [Buildroot] [PATCH] linux: Install the device tree in /boot
	when installing the kernel
In-Reply-To: <1360852074-22050-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Thu, 14 Feb 2013 15:27:54 +0100")
References: <1360852074-22050-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87bobgj5p7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> The option BR2_LINUX_KERNEL_INSTALL_TARGET used to install the
 Maxime> kernel in /boot in the rootfs. The introduction of the device
 Maxime> tree builds made it possible to generate device tree blobs, and
 Maxime> stored them in IMAGES_DIR like the kernel, but didn't copy the
 Maxime> dtb in /boot when _INSTALL_TARGET was enabled.

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
