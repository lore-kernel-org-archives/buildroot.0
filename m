From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 23:04:09 +0100
Subject: [Buildroot] [PATCH] package/minetest{-game}: bump to version
 5.3.0
In-Reply-To: <20201206153528.1345269-1-romain.naour@gmail.com>
References: <20201206153528.1345269-1-romain.naour@gmail.com>
Message-ID: <20201229230409.3b894a60@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Dec 2020 16:35:28 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> See Changelog [1]
> 
> Disable unittests build with the new BUILD_UNITTESTS option.
> 
> Update minetest-game licence file hash for:
>   mods/default/license.txt [2]
>   mods/farming/license.txt [3]
> 
> Update minetest license file hash for:
>   LICENSE.txt [4]
> 
> [1] https://dev.minetest.net/Changelog#5.2.0_.E2.86.92_5.3.0
> [2] https://github.com/minetest/minetest_game/commit/0662f962842b071525fa00ce970d8cc645bd68a4
> [3] https://github.com/minetest/minetest_game/commit/e5a7af1c4abaf06ad764bf7c5da058fd136871c0
> [4] https://github.com/minetest/minetest/commit/9a64a9fd9427fc3b62d4dc9bf1ca7c15477ebc5a
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/minetest-game/minetest-game.hash | 6 +++---
>  package/minetest-game/minetest-game.mk   | 2 +-
>  package/minetest/minetest.hash           | 4 ++--
>  package/minetest/minetest.mk             | 5 +++--
>  4 files changed, 9 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
