From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:07:09 +0200
Subject: [Buildroot] [PATCH v2 22/37] boot/*/Config.in: fix attributes
 order
In-Reply-To: <20180401050850.5701-23-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-23-ricardo.martincoski@gmail.com>
Message-ID: <20180401080709.2ca59ffb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:35 -0300, Ricardo Martincoski wrote:
> ... to follow the convention: type, default, depends on, select, help.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  boot/at91bootstrap/Config.in     |  2 +-
>  boot/at91bootstrap3/Config.in    |  2 +-
>  boot/at91dataflashboot/Config.in |  2 +-
>  boot/lpc32xxcdl/Config.in        |  2 +-
>  boot/mxs-bootlets/Config.in      |  8 ++++----
>  boot/uboot/Config.in             | 12 ++++++------
>  6 files changed, 14 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
