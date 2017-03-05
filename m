From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:57:21 +0100
Subject: [Buildroot] [PATCH 2/5] board/minnowboard: remove support for
 minnowboard
In-Reply-To: <20170301083046.13226-2-arnout@mind.be>
References: <20170301083046.13226-1-arnout@mind.be>
 <20170301083046.13226-2-arnout@mind.be>
Message-ID: <20170305215721.2fdcce7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 09:30:43 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The scripts used for the minnowboards were generic for MinnowBoard and
> MinnowBoard MAX. Since we removed the original MinnowBoard, this isn't
> necessary anymore.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Separate commit because we may not want to do this: it doesn't hurt to
> have this generic mechanism, and if later someone wants to re-add
> MinnowBoard or add support for a new generation of the board, it's
> convenient to still have it around.
> ---
>  board/minnowboard/{grub-minnowboard-max.cfg => grub.cfg} | 0
>  board/minnowboard/post-build.sh                          | 4 +---
>  configs/minnowboard_max-graphical_defconfig              | 1 -
>  configs/minnowboard_max_defconfig                        | 1 -
>  4 files changed, 1 insertion(+), 5 deletions(-)
>  rename board/minnowboard/{grub-minnowboard-max.cfg => grub.cfg} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
