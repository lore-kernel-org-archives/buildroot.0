From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 18:26:52 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 04/10] lua*: restore version
 in module paths
In-Reply-To: <1384520859-3189-4-git-send-email-francois.perrad@gadz.org>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <20131222182652.63afbf2e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 15 Nov 2013 14:07:33 +0100, Francois Perrad wrote:
> (like in upstream)
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/cgilua/cgilua.mk                         |    6 +++---
>  package/copas/copas.mk                           |    4 ++--
>  package/coxpcall/coxpcall.mk                     |    4 ++--
>  package/lbase64/lbase64.mk                       |    4 ++--
>  package/lua-ev/lua-ev.mk                         |    2 +-
>  package/lua-msgpack-native/lua-msgpack-native.mk |    4 ++--
>  package/lua/lua-01-root-path.patch               |   21 ++++-----------------
>  package/luabitop/luabitop.mk                     |    5 ++---
>  package/luacjson/luacjson.mk                     |    4 ++--
>  package/luaexpat/luaexpat.mk                     |   10 +++++-----
>  package/luaexpatutils/luaexpatutils.mk           |    4 ++--
>  package/luafilesystem/luafilesystem.mk           |    4 ++--
>  package/luajit/luajit-01-root-path.patch         |   22 ----------------------
>  package/luaposix/luaposix.mk                     |    2 +-
>  package/luasec/luasec.mk                         |   12 +++++-------
>  package/luasocket/luasocket.mk                   |   16 ++++++++--------
>  package/luasql/luasql.mk                         |    7 +++----
>  package/orbit/orbit.mk                           |    2 +-
>  package/rings/rings.mk                           |    7 +++----
>  package/wsapi/wsapi.mk                           |    6 +++---
>  package/xavante/xavante.mk                       |   10 ++++------
>  21 files changed, 57 insertions(+), 99 deletions(-)
>  delete mode 100644 package/luajit/luajit-01-root-path.patch

Is this patch really necessary, since in the next patches you remove
all of this code when converting the Lua packages to the Lua package
infrastructure?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
