From: Jordan Yelloz <jordan@yelloz.me>
Date: Sun, 24 Jul 2016 16:27:35 -0700
Subject: [Buildroot] [PATCH 0/4] swupdate: allow configuring with LuaJIT
Message-ID: <20160724232739.14132-1-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows people to build swupdate against LuaJIT for custom Lua upgrade
manifest parsers or pre/post-install hook scripts.

Also, information was added about the limitations of building against Lua 5.1
(which is currently allowed in buildroot) or LuaJIT.

Jordan Yelloz (4):
  swupdate: allowed luajit to enable HAVE_LUA
  swupdate: updated lua check for libconfig
  swupdate: improved help text for Lua support
  swupdate: added a warning for LuaJIT/Lua 5.1

 package/swupdate/Config.in   | 15 +++++++++++++--
 package/swupdate/swupdate.mk |  3 +++
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.9.2
