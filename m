From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:27:14 +0100
Subject: [Buildroot] [PATCH] boot/grub: fix grub-mkimage with binutils
 >= 2.31
In-Reply-To: <1544694457-13704-1-git-send-email-romain.naour@smile.fr> (Romain
 Naour's message of "Thu, 13 Dec 2018 10:47:37 +0100")
References: <1544694457-13704-1-git-send-email-romain.naour@smile.fr>
Message-ID: <87pnu15fil.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > While using pc_x86_64_efi_defconfig with a bleeding-edge x86_64 toolchain
 > based on binutils 2.31, the grub-mkimage command return this error:

 > grub-mkimage: error: relocation 0x4 is not implemented yet.

 > Backport an upstream patch [1] as suggested on openembedded mailing list [2].

 > [1] http://git.savannah.gnu.org/cgit/grub.git/commit/?id=842c390469e2c2e10b5aa36700324cd3bde25875
 > [2] http://lists.openembedded.org/pipermail/openembedded-core/2018-July/153054.html

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
