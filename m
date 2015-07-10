From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 17:18:49 +0200
Subject: [Buildroot] [PATCH] buildroot-test: br-mips64-n64-glibc
 toolchain is only for hard float
In-Reply-To: <1436541075-18777-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1436541075-18777-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150710171849.476aa6bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 10 Jul 2015 17:11:15 +0200, Vicente Olivert Riera wrote:
> Otherwise it will fail with errors like this one:
> 
> /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/gnu/stubs.h:32:33:
> fatal error: gnu/stubs-n64_soft.h: No such file or directory
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5ce/5cefa90f2a19ed55ae88d938bf134dbdbfc7b9c2/
>   http://autobuild.buildroot.net/results/85f/85fa358930474c608b558176a8eac77a5844d94b/
>   http://autobuild.buildroot.net/results/fa4/fa4310bea91682ae42b09ba0584f0261f1cb2d08/
>   http://autobuild.buildroot.net/results/d34/d345c568fbfbacf3d62a94fae995983127e0d629/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  web/toolchains/configs/br-mips64-n64-glibc.config | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
