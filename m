From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 22:59:45 +0200
Subject: [Buildroot] [PATCH 1/5] arch/mips: add option for toolchains
 supporting -mnan
In-Reply-To: <20170721170635.41202-1-Vincent.Riera@imgtec.com>
References: <20170721170635.41202-1-Vincent.Riera@imgtec.com>
Message-ID: <20170721225945.4568bb11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 18:06:31 +0100, Vicente Olivert Riera wrote:
> -mnan option was added in gcc-4.9.0 so make sure that users cannot
> select the NaN mode when using toolchains that have a gcc older
> than 4.9.0, and also make sure that the -mnan option is not passed at
> all to the toolchain-wrapper and target cflags.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  arch/Config.in.mips                                    | 1 +
>  toolchain/toolchain-common.in                          | 4 ++++
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 ++
>  3 files changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
