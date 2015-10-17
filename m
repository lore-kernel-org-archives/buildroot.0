From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:21:55 +0200
Subject: [Buildroot] [PATCH] toolchain-external/CodeSourcery MIPS:
 available only for R2
In-Reply-To: <1445011202-47571-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1445011202-47571-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151017162155.097e9f42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 16 Oct 2015 17:00:01 +0100, Vicente Olivert Riera wrote:
> Currently the CodeSourcery toolchains for MIPS can be selected to build
> mips32 (revision level 1) targets, but the resulting binaries are built
> for mips32r2 instead. This is because these toolchains don't have
> library support other than mips32r2, so there is no point to allow the
> selection of a mips32 variant with a CodeSourcery MIPS toolchain, since
> everything will be built for mips32r2 instead.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  toolchain/toolchain-external/Config.in |    9 +++------
>  1 files changed, 3 insertions(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
