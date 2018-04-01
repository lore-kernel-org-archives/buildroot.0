From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:09:33 +0200
Subject: [Buildroot] [PATCH v2 25/37] toolchain/*/Config.in: fix
 attributes order
In-Reply-To: <20180401050850.5701-26-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-26-ricardo.martincoski@gmail.com>
Message-ID: <20180401090933.4bda9f55@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:38 -0300, Ricardo Martincoski wrote:
> ... to follow the convention: type, default, depends on, select, help.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  toolchain/Config.in                                          |  2 +-
>  toolchain/toolchain-buildroot/Config.in                      |  2 +-
>  .../toolchain-external-custom/Config.in.options              | 12 ++++++------
>  3 files changed, 8 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
