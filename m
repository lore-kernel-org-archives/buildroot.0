From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 19:24:28 +0200
Subject: [Buildroot] [PATCH] package/lua-flu: bump to 20181218 release
In-Reply-To: <20190510083859.6816-1-m.niestroj@grinn-global.com>
References: <20190510083859.6816-1-m.niestroj@grinn-global.com>
Message-ID: <20190514192428.07244d23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 May 2019 10:38:59 +0200
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Also drop patch which is part of new release.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/lua-flu/0001-use-system-xattr-h.patch | 169 ------------------
>  package/lua-flu/lua-flu.hash                  |   4 +-
>  package/lua-flu/lua-flu.mk                    |   4 +-
>  3 files changed, 4 insertions(+), 173 deletions(-)
>  delete mode 100644 package/lua-flu/0001-use-system-xattr-h.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
