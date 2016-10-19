From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:31:36 +0200
Subject: [Buildroot] [PATCH] MIPS: add support for M6201 cores
In-Reply-To: <20161018155525.29327-1-Vincent.Riera@imgtec.com>
References: <20161018155525.29327-1-Vincent.Riera@imgtec.com>
Message-ID: <20161019233136.1b513ec5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Oct 2016 16:55:25 +0100, Vicente Olivert Riera wrote:
> -march=m6201 is not yet supported in GCC upstream, so disabling all
> versions when selecting this core.
> 
> Note that M6201 implies a MIPS R6 CPU, and some GCC versions are already
> disabled for R6, so we don't need to disable those ones for M6201 as
> well.
> 
> The external Codescape IMG GNU Linux Toolchain has support for this
> core.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  arch/Config.in.mips        | 5 +++++
>  package/gcc/Config.in.host | 5 +++--
>  2 files changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
