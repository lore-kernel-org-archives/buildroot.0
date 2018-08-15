From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 21:13:44 +0200
Subject: [Buildroot] [PATCH] luarocks: bump to version 3.0.1
In-Reply-To: <20180815143104.27453-1-francois.perrad@gadz.org>
References: <20180815143104.27453-1-francois.perrad@gadz.org>
Message-ID: <20180815211344.3116d32a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Wed, 15 Aug 2018 16:31:04 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../0001-allow-libluajit-detection.patch      | 32 -------------------
>  package/luarocks/luarocks.hash                |  2 +-
>  package/luarocks/luarocks.mk                  |  8 ++---
>  3 files changed, 4 insertions(+), 38 deletions(-)
>  delete mode 100644 package/luarocks/0001-allow-libluajit-detection.patch

I was about to apply, but it doesn't apply to next. I could fix the
conflicts myself, but I also found that the commit log was a bit too
short. Could you add some details as to why the patch can be dropped ?
Why is sysconfdir changed to /etc instead of /etc/luarocks ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
