From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 12:07:16 +0200
Subject: [Buildroot] [PATCH] luarocks: fix lua modules building with
 luajit
In-Reply-To: <20180729094457.32098-1-francois.perrad@gadz.org>
References: <20180729094457.32098-1-francois.perrad@gadz.org>
Message-ID: <20180805120716.066d6ae2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Jul 2018 11:44:57 +0200, Francois Perrad wrote:
> currently, when luajit is selected as luainterpreter,
> all lua module fails to build with the message:
>     Error: Failed finding Lua library. You may need to configure LUA_LIBDIR.
> 
> see http://autobuild.buildroot.net/results/66de049c306d7aff66894d53e2f4fa755fd01594
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../0001-allow-libluajit-detection.patch      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/luarocks/0001-allow-libluajit-detection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
