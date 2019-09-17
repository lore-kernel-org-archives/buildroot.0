From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Sep 2019 22:27:44 +0200
Subject: [Buildroot] [PATCH] configs/aarch64_efi: fix typo AARCH64 ->
 ARM64
In-Reply-To: <20190906101203.7549-1-romain.naour@smile.fr> (Romain Naour's
 message of "Fri, 6 Sep 2019 12:12:03 +0200")
References: <20190906101203.7549-1-romain.naour@smile.fr>
Message-ID: <87d0fy3by7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > There is no option BR2_TARGET_GRUB2_AARCH64_EFI but
 > BR2_TARGET_GRUB2_ARM64_EFI in grub2 package.

 > BR2_TARGET_GRUB2_ARM64_EFI was introduced by the commit [1].

 > [1] 273a27804a18c5e232907d5ef6bd01957cf090d7

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Erico Nunes <nunes.erico@gmail.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
