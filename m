From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 May 2013 23:26:25 +0200
Subject: [Buildroot] [PATCH] rpi-firmware: Fixup config.txt
In-Reply-To: <1367312888-22216-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Tue, 30 Apr 2013 11:08:08 +0200")
References: <1367312888-22216-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87vc71ysxq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> The default name of the kernel binary for the RaspberryPi is
 Maxime> kernel.img, it's only a zImage kernel renamed.  Since Buildroot
 Maxime> will build a zImage, the default config should use the zImage
 Maxime> name instead of forcing the user to rename a file.

 Maxime> This patch also remove the cmdline argument rootfstype. There
 Maxime> is no point forcing the user to use ext4 for its root
 Maxime> partition.

 Maxime> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
