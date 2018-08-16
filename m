From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 11:58:42 +0200
Subject: [Buildroot] [V2] luarocks: bump to version 3.0.1
In-Reply-To: <20180816073049.5501-1-francois.perrad@gadz.org>
References: <20180816073049.5501-1-francois.perrad@gadz.org>
Message-ID: <20180816115842.4af7e63c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Aug 2018 09:30:49 +0200, Francois Perrad wrote:
> The meaning of --sysconfdir has changed (see announcement http://lua-users.org/lists/lua-l/2018-08/msg00101.html),
> So, LUAROCKS_CONFIG_DIR & LUAROCKS_CONFIG_FILE are adjusted.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luarocks/0001-allow-libluajit-detection.patch | 4 +++-
>  package/luarocks/luarocks.hash                        | 2 +-
>  package/luarocks/luarocks.mk                          | 6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
