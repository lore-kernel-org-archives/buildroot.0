From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:02:25 +0200
Subject: [Buildroot] [PATCH] openblas: fix build with musl libc
In-Reply-To: <dbeb63928c8d303e263ff75475d99a82b6bfa2e4.1523980616.git.baruch@tkos.co.il>
References: <dbeb63928c8d303e263ff75475d99a82b6bfa2e4.1523980616.git.baruch@tkos.co.il>
Message-ID: <20180425230225.70be6ff2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 18:56:56 +0300, Baruch Siach wrote:
> Add upstream patches to avoid use of __GLIBC_PREREQ when this macro is
> not defined.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f13/f13d93372449c9bf1b3c79ed056b8d820470ae89/
> http://autobuild.buildroot.net/results/e1c/e1cdcdfe15b4af523c7db71952ac25163733ffb1/
> http://autobuild.buildroot.net/results/778/77821a4a37171080fc7ee917862e77babeb06b88/
> 
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...REREQ-checks-to-avoid-breaking-non-g.patch | 73 +++++++++++++++++++
>  ...d-when-__GLIBC_PREREQ-is-not-defined.patch | 45 ++++++++++++
>  2 files changed, 118 insertions(+)
>  create mode 100644 package/openblas/0002-Rework-__GLIBC_PREREQ-checks-to-avoid-breaking-non-g.patch
>  create mode 100644 package/openblas/0003-Fix-build-when-__GLIBC_PREREQ-is-not-defined.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
