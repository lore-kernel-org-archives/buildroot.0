From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:45:21 +0100
Subject: [Buildroot] [PATCH master 1/3] MIPS: remove M5100 core
In-Reply-To: <20161108103258.32196-1-Vincent.Riera@imgtec.com>
References: <20161108103258.32196-1-Vincent.Riera@imgtec.com>
Message-ID: <20161109224521.10204f5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Nov 2016 10:32:56 +0000, Vicente Olivert Riera wrote:
> This is a microcontroller class (MCU) core which is not suitable for
> running Linux.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  arch/Config.in.mips                    | 5 -----
>  package/gcc/Config.in.host             | 5 ++---
>  toolchain/toolchain-external/Config.in | 2 +-
>  3 files changed, 3 insertions(+), 9 deletions(-)

All patches applied to master. Thanks Arnout for the review!

I have to say it's unfortunate that the gcc option doesn't match the
actual name of the core :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
