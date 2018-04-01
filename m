From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:02:17 +0200
Subject: [Buildroot] [PATCH v2 21/37] arch/Config.in*: fix attributes
 order
In-Reply-To: <20180401050850.5701-22-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-22-ricardo.martincoski@gmail.com>
Message-ID: <20180401080217.073c05c0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:34 -0300, Ricardo Martincoski wrote:
> ... to follow the convention: type, default, depends on, select, help.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  arch/Config.in         |  2 +-
>  arch/Config.in.arc     |  2 +-
>  arch/Config.in.arm     |  4 ++--
>  arch/Config.in.bfin    |  2 +-
>  arch/Config.in.m68k    |  2 +-
>  arch/Config.in.mips    |  8 ++++----
>  arch/Config.in.powerpc |  4 ++--
>  arch/Config.in.sh      |  2 +-
>  arch/Config.in.sparc   |  2 +-
>  arch/Config.in.x86     | 30 +++++++++++++++---------------
>  arch/Config.in.xtensa  |  8 ++++----
>  11 files changed, 33 insertions(+), 33 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
