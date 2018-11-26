From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 22:12:25 +0100
Subject: [Buildroot] [PATCH v3 5/5] grub2: add usage notes for grub2 arm
 and aarch64
In-Reply-To: <20180926223719.12604-6-nunes.erico@gmail.com>
References: <20180926223719.12604-1-nunes.erico@gmail.com>
 <20180926223719.12604-6-nunes.erico@gmail.com>
Message-ID: <20181126221225.306c3271@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Sep 2018 00:37:19 +0200, Erico Nunes wrote:
> Add notes to test grub2 running on ARM using qemu. The arm section
> describes how to run it using u-boot and aarch64 shows how to do it
> using efi, which is similar to what has to be done for x86_64.
> 
> The source for OVMF builds is also changed to
> https://www.kraxel.org/repos/jenkins/edk2/ which is the source for
> nightly builds (as rpms but which can be extracted in any distribution),
> as the sourceforge link provided only very old builds.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  boot/grub2/readme.txt | 140 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 136 insertions(+), 4 deletions(-)

I'm not sure why you gave all those details for the AArch64/EFI case,
instead of just pointing to your aarch64_efi_defconfig configuration.
So I've simplified this part to use aarch64_efi_defconfig instead, did
some minor formatting fixes here and there, and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
