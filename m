From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 22:01:02 +0200
Subject: [Buildroot] [PATCH v2] uboot: arm64 arch build support
In-Reply-To: <1444675996-17536-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1444675996-17536-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20151012220102.36207377@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, Ronak,

On Mon, 12 Oct 2015 13:53:16 -0500, Matt Weber wrote:
> From: Ronak Desai <ronak.desai@rockwellcollins.com>
> 
> For a 64bit arm architecture, Buildroot uses arm64 terminology
> and from the top-level Makefile KERNEL_ARCH is set to
> arm64 which is then passed to the uboot build.
> This causes a compilation issue as uboot uses the top-level
> system architecture as it's $(ARCH).  So arch/$(ARCH)/Makefile
> doesn't work with arm64 unless we adjust the arch.
> 
> Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  boot/uboot/uboot.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied with some minor tweaks:

    [Thomas:
     - rewrap commit message text.
     - simplify comment in the code.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
