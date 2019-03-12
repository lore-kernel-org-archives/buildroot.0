From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 21:54:12 +0100
Subject: [Buildroot] [PATCH] package/minetest: bump to version 5.0.0
In-Reply-To: <20190312191226.8700-1-romain.naour@gmail.com>
References: <20190312191226.8700-1-romain.naour@gmail.com>
Message-ID: <20190312215412.753c77c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Mar 2019 20:12:26 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> "5.0.0 is a breaking release and not compatible to the 0.4 series", so
> update minetest-game package in the same commit.
> 
> Update GCC dependency to 4.9+.
> 
> Use LICENSE.txt as license file instead of the README.md.
> 
> Update license files hash for minetest-game after checking what's changed.
> Add new license files for minetest-game.
> 
> https://forum.minetest.net/viewtopic.php?t=22278
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/minetest-game/minetest-game.hash | 21 ++++++++++++++-------
>  package/minetest-game/minetest-game.mk   |  9 ++++++++-
>  package/minetest/Config.in               |  8 ++++----
>  package/minetest/minetest.hash           |  4 ++--
>  package/minetest/minetest.mk             |  4 ++--
>  5 files changed, 30 insertions(+), 16 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
