From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 10:12:08 +0200
Subject: [Buildroot] [PATCH] openblas: fix build failure for MIPS n32
In-Reply-To: <1468515652-63841-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1468515652-63841-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160715101208.5201eee7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 18:00:52 +0100, Vicente Olivert Riera wrote:
> Support for n32 ABI in OpenBLAS is not complete. Adding a patch to fix
> this problem.
> 
> This patch has been sent upstream as a pull request:
> 
>   https://github.com/xianyi/OpenBLAS/pull/926
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/1e8/1e8506a0d7b4fe1b773535f7d23ca422c03f9770/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  .../0001-Complete-support-for-MIPS-n32-ABI.patch   | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 package/openblas/0001-Complete-support-for-MIPS-n32-ABI.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
