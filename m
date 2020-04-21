From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:25:45 +0200
Subject: [Buildroot] [PATCH] package/lua-utf8: bump to version 0.1.2
In-Reply-To: <20200420060715.31260-1-francois.perrad@gadz.org>
References: <20200420060715.31260-1-francois.perrad@gadz.org>
Message-ID: <20200421082545.088b8425@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 08:07:15 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> switch of rocks maintainer
> from https://luarocks.org/modules/dannote/utf8
> to https://luarocks.org/modules/xavier-wang/luautf8
> 
> the upstream author stays http://github.com/starwing/luautf8
> 
> now, the version scheme is aligned on the upstream one,
> and the version 0.1.2 was released on 06 Apr 2020.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-utf8/lua-utf8.hash | 3 ++-
>  package/lua-utf8/lua-utf8.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
