From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 21:19:05 +0100
Subject: [Buildroot] [PATCH for-2015.11] uboot: fix ARCH for i386 and
 x86_64
In-Reply-To: <1447617332-3500-1-git-send-email-arnout@mind.be>
References: <1447617332-3500-1-git-send-email-arnout@mind.be>
Message-ID: <20151116211905.65f29ef9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, 15 Nov 2015 20:55:32 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> This could perhaps be refactored with similar handling of
> KERNEL_ARCH_PATH in linux.mk. But that's for someone else :-)
> ---
>  boot/uboot/uboot.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, after testing that a x86-64 configuration can build
the galileo_defconfig of U-Boot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
