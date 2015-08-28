From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 20:23:25 +0200
Subject: [Buildroot] [PATCH 2/2] qemu: add new board support for
 qemu-system-sparc64
In-Reply-To: <20150811203746.GA10023@waldemar-brodkorb.de>
References: <20150811203746.GA10023@waldemar-brodkorb.de>
Message-ID: <20150828202325.755e5912@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 11 Aug 2015 22:37:46 +0200, Waldemar Brodkorb wrote:

> diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
> new file mode 100644
> index 0000000..5c5bcb3
> --- /dev/null
> +++ b/configs/qemu_sparc64_sun4u_defconfig
> @@ -0,0 +1,21 @@
> +# Architecture
> +BR2_sparc64=y
> +BR2_sparc_v9=y
> +
> +BR2_GLOBAL_PATCH_DIR="board/qemu/sparc64-sun4u"

Why do you need this option set?

THanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
