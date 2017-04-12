From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:15:14 +0200
Subject: [Buildroot] [PATCH] config: update linux version in zebu
 defconfig
In-Reply-To: <1491928333-30537-1-git-send-email-vzakhar@synopsys.com>
References: <1491928333-30537-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170412211514.4e6a828d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Apr 2017 19:32:13 +0300, Vlad Zakharov wrote:
> With this commit we update snps_archs38_zebu_defconfig the following:
> 
>   - bump linux kernel version to 4.10.9
>   - set up host linux headers to 4.10
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  configs/snps_archs38_zebu_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master with a tweaked commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
