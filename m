From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 21:38:02 +0100
Subject: [Buildroot] [PATCH v2] config: bump U-Boot to 2016.11 in
 synopsys defconfigs
In-Reply-To: <1479146820-46777-1-git-send-email-vzakhar@synopsys.com>
References: <1479146820-46777-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161114213802.56e8627f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 21:07:00 +0300, Vlad Zakharov wrote:
> With this commit we upgrade U-Boot version to 2016.11
> in "snps_axs101_defconfig" and "snps_axs103_defconfig".
> 
> Important fixes: new version fixes U-Boot build for arc700.
> Since gcc-6.x "-marc700" option is no longer supported,
> "-mcpu=arc700" should be used instead.
> 
> We haven't sent it before as we were waiting for U-Boot
> 2016.11 release.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
> Changes v1..v2
>  - Replace 2016.11-rc3 release candidate with 2016.11 release version

Applied to master, after slightly tweaking the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
