From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Oct 2017 21:27:46 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.09-rc1
In-Reply-To: <20170921182828.26985-1-didin@synopsys.com>
References: <20170921182828.26985-1-didin@synopsys.com>
Message-ID: <20171003212746.22c89884@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Sep 2017 21:28:28 +0300, Evgeniy Didin wrote:

> diff --git a/package/binutils/arc-2017.09-rc1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch b/package/binutils/arc-2017.09-rc1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
> new file mode 100644
> index 000000000..e5409efe1
> --- /dev/null
> +++ b/package/binutils/arc-2017.09-rc1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
> @@ -0,0 +1,31 @@
> +From 122de3b633f4273826a2d01702d7c515f93ec2be Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Sat, 29 Jul 2017 14:08:20 +0200
> +Subject: [PATCH] Fixes: LINKER BUG: .rofixup section size mismatch
> +
> +Workaround from adi-toolchain commit:
> +af414ec1fb628ddb1562f062f3db49823ca14ca2
> +[#6798] binutils-2.21/bfd: temp workaround for rofixup mismatch errors.
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +---
> + bfd/elf32-bfin.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)

What is the point of adding this Blackfin-only patch to the patch stack
used only for the ARC binutils version ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
