From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 22:33:07 +0100
Subject: [Buildroot] [PATCH] configs: snps_aarch64_vdk_defconfig: kernel
 pointing to 4.6
In-Reply-To: <0a6fcad277c1a7408815a57d9e138272feb0dfed.1479491815.git.jpinto@synopsys.com>
References: <0a6fcad277c1a7408815a57d9e138272feb0dfed.1479491815.git.jpinto@synopsys.com>
Message-ID: <20161118223307.36a21a13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 18:01:56 +0000, Joao Pinto wrote:
> Previously the vdk solution was using a linaro kernel that is currently
> having build problems.
> Since there is no point in using Linaro anymore for this solution,
> this patch makes the aarch64 vdk solution point to 4.6 linux kernel.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> ---
>  configs/snps_aarch64_vdk_defconfig | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
