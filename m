From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 10:24:02 +0200
Subject: [Buildroot] [PATCH] package/luarocks: fix typo
In-Reply-To: <20200419074827.11205-1-francois.perrad@gadz.org>
References: <20200419074827.11205-1-francois.perrad@gadz.org>
Message-ID: <20200419102402.557dcebf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 09:48:27 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> many build are broken, that starts by this kind of message:
>  Warning: could not load configuration file `.../host/etc/luarocks/config.lua` given in environment variable LUAROCKS_CONFIG
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luarocks/luarocks.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. Sorry for the typo, my fault :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
