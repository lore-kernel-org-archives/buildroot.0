From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:57:18 +0100
Subject: [Buildroot] [PATCH 1/5] minnowboard_defconfig: remove broken
 defconfig
In-Reply-To: <20170301083046.13226-1-arnout@mind.be>
References: <20170301083046.13226-1-arnout@mind.be>
Message-ID: <20170305215718.76b5a2ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 09:30:42 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This defconfig has been broken due to gcc5 for more than half a year,
> and nobody stepped up to fix it. Remove it, as well as the files it
> references. Update the readme to remove references to MinnowBoard.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  board/minnowboard/grub-minnowboard.cfg |   6 --
>  board/minnowboard/linux-3.8.config     | 172 ---------------------------------
>  board/minnowboard/readme.txt           |  10 +-
>  configs/minnowboard_defconfig          |  32 ------
>  4 files changed, 3 insertions(+), 217 deletions(-)
>  delete mode 100644 board/minnowboard/grub-minnowboard.cfg
>  delete mode 100644 board/minnowboard/linux-3.8.config
>  delete mode 100644 configs/minnowboard_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
