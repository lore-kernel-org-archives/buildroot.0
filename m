From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 13:04:04 +0100
Subject: [Buildroot] [PATCH] luarocks: refactor buildroot addon without
 patch
In-Reply-To: <20190120071945.11304-1-francois.perrad@gadz.org>
References: <20190120071945.11304-1-francois.perrad@gadz.org>
Message-ID: <20190206130404.61fade67@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Jan 2019 08:19:45 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> addon commands are actually implemented in luarocks 3.0.4,
> and they must be located in luarocks/cmd/external.
> 
> so, it is useless to patch luarocks.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luarocks/0002-Buildroot-addon.patch | 361 --------------------
>  package/luarocks/buildroot.lua              | 326 ++++++++++++++++++
>  package/luarocks/luarocks.mk                |   6 +
>  3 files changed, 332 insertions(+), 361 deletions(-)
>  delete mode 100644 package/luarocks/0002-Buildroot-addon.patch
>  create mode 100644 package/luarocks/buildroot.lua

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
