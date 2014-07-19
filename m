From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Jul 2014 16:38:54 +0200
Subject: [Buildroot] [lua V4 0/4] lua
Message-ID: <1405780738-31323-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

delta V4 vs V3 (remaining)
 - refactor with the host-virtual-package infrastructure

Francois Perrad (4):
  luajit: add host variant
  luainterpreter: add host variant
  luarocks: allow to work with host-luainterpreter
  lua-iconv: new package

 package/Config.in                        |  1 +
 package/lua-iconv/Config.in              |  8 ++++++++
 package/lua-iconv/lua-iconv.mk           | 14 ++++++++++++++
 package/luainterpreter/luainterpreter.mk |  3 +++
 package/luajit/luajit.mk                 |  9 +++++++++
 package/luarocks/luarocks.mk             | 18 ++++++++++++------
 6 files changed, 47 insertions(+), 6 deletions(-)
 create mode 100644 package/lua-iconv/Config.in
 create mode 100644 package/lua-iconv/lua-iconv.mk

-- 
1.9.1
