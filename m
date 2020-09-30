From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:49:21 +0200
Subject: [Buildroot] [PATCH] package/luarocks: refactor infrastructure
 with DEPS_DIR
In-Reply-To: <20200928154349.2193859-1-francois.perrad@gadz.org>
References: <20200928154349.2193859-1-francois.perrad@gadz.org>
Message-ID: <20200930224921.29352fa0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Sep 2020 17:43:49 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> DEPS_DIR is a new CLI option introduced by the version 3.4.0,
> which avoids the use of `external_deps_dirs` in the config files.
> 
> now, the host config doesn't need to be altered.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luarocks/luarocks-br-config.lua      | 5 -----
>  package/luarocks/luarocks-br-host-config.lua | 3 ---
>  package/luarocks/luarocks.mk                 | 9 +++++----
>  package/pkg-luarocks.mk                      | 2 ++
>  4 files changed, 7 insertions(+), 12 deletions(-)
>  delete mode 100644 package/luarocks/luarocks-br-config.lua
>  delete mode 100644 package/luarocks/luarocks-br-host-config.lua

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
