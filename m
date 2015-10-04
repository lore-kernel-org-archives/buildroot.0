From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 15:40:46 +0100
Subject: [Buildroot] [PATCH] arc: add HS38 VDK virtual boards
In-Reply-To: <1441724062-27521-1-git-send-email-abrodkin@synopsys.com>
References: <1441724062-27521-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20151004154046.5dd0315a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue,  8 Sep 2015 17:54:22 +0300, Alexey Brodkin wrote:
> Virtualizer Development Kits (VDKs) are software development kits
> containing design-specific virtual prototypes as well as debug and
> analysis tools and sample software.
> 
> With this change we add support for VDK based on ARC HS38 core.
> 
> Note that FS-overlay is required to allow instantiation of console on
> both serial port and LCD screen simultaneously.
> 
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  configs/snps_hs38_smp_vdk_defconfig | 21 +++++++++++++++++++++
>  configs/snps_hs38_vdk_defconfig     | 21 +++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 configs/snps_hs38_smp_vdk_defconfig
>  create mode 100644 configs/snps_hs38_vdk_defconfig

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
