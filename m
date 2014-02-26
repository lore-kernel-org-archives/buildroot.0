From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 26 Feb 2014 11:03:13 +0100
Subject: [Buildroot] [lua v2 0/4] lua
Message-ID: <1393408997-32259-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

delta V2 vs V1
  - only a subset for 2014.02
  - add fix for Blackfin FLAT

Francois Perrad (4):
  lua: remove LUA_INSTALLED_FILES
  lua: refactor install steps
  lua: handles BR2_PREFER_STATIC_LIB
  luarocks: never wraps script

 package/Config.in                                  |    3 +-
 package/lua/5.1.5/lua-02-shared-libs-for-lua.patch |   39 +++++++++++--
 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch |   39 +++++++++++--
 package/lua/lua.mk                                 |   60 ++++++--------------
 package/luarocks/luarocks.mk                       |    1 +
 5 files changed, 87 insertions(+), 55 deletions(-)

-- 
1.7.9.5
