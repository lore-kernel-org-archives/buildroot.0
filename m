From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 14:01:52 +0200
Subject: [Buildroot] [PATCH] configs/snps_archs38_zebu: rename zebu to
 haps
In-Reply-To: <1492532385-24563-1-git-send-email-vzakhar@synopsys.com>
References: <1492532385-24563-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170507140152.1dc0db36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Apr 2017 19:19:45 +0300, Vlad Zakharov wrote:
> As in upstream Linux zebu_hs_smp_defconfig was renamed to
> haps_hs_smp_defconfig we update Linux kernel defconfig name
> respectively.
> 
> Also it fixes build failure, pointed us by Arnout:
> https://gitlab.com/buildroot.org/buildroot/builds/14419271
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  configs/{snps_archs38_zebu_defconfig => snps_archs38_haps_defconfig} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename configs/{snps_archs38_zebu_defconfig => snps_archs38_haps_defconfig} (91%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
