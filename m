From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:28:46 +0100
Subject: [Buildroot] [PATCH] ARC: bump tools to 2014.12 release
In-Reply-To: <1422879584-18485-1-git-send-email-abrodkin@synopsys.com>
References: <1422879584-18485-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150202212846.5ed07829@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon,  2 Feb 2015 15:19:44 +0300, Alexey Brodkin wrote:
> Now when new shiny tools are released by Synopsys we're ready for
> version update in Buildroot again.
> 
> More details about arc-2014.12 release are available here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2014.12
> 
> Following patches were removed from GCC since they are a part of release
> now:
>  * 200-size_type_unsigned_int.patch
>  * 300-ptrdiff_type_int.patch
>  * 400-call-arc_hazard-before-branch-shortening.patch
>  * 401-fix-length-attribute-for-casesi_load-pattern.patch
>  * 402-fix-length-of-instructions-that-are-in-delay-slot-and-needs-to-be-predicated.patch
>  * 403-update-casesi_compact_jump-instruction-length.patch
> 
> But since arc-2014.12 tools are still based on GCC 4.8 following patches
> ar still relevant so moving to the new folder to match ARC gcc bump.
>  * 100-libstdcxx-uclibc-c99.patch
>  * 910-gcc-poison-system-directories.patch
> 
> Binutils are still based on 2.23 so following patch still makes sense:
>  * 600-poison-system-directories.patch
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
