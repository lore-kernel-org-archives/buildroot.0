From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:50:00 +0100
Subject: [Buildroot] [PATCH v2 0/2] Misc Lua package fixes
Message-ID: <20181231165003.18574-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a new iteration of my Lua package fixes. They have been
rebased on master, following the merge of the Luarocks addon and the
changes to many existing Lua packages to match the output of the
addon. As part of this, lots of BR2_PACKAGE_HAS_LUAINTERPRETER have
been dropped, and only a few remain to be removed in this series.

Thanks,

Thomas

Thomas Petazzoni (2):
  package/lua*: drop redundant dependencies on
    BR2_PACKAGE_HAS_LUAINTERPRETER
  package/lua-msgpack-native: adjust Config.in comment

 package/lbase64/Config.in            | 1 -
 package/lua-ev/Config.in             | 1 -
 package/lua-msgpack-native/Config.in | 3 +--
 package/luaposix/Config.in           | 1 -
 package/lutok/Config.in              | 1 -
 5 files changed, 1 insertion(+), 6 deletions(-)

-- 
2.20.1
