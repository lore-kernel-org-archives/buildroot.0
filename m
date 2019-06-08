From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  8 Jun 2019 23:18:25 +0200
Subject: [Buildroot] [Lua 0/2] Lua modules removal
Message-ID: <20190608211827.7731-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This serie removes 2 Lua modules which are Lua 5.1 only
and not actively maintained by upstream.

Francois Perrad (2):
  package/lua-msgpack-native: remove it
  package/orbit: remove it

 Config.in.legacy                              | 14 ++++++++++++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  2 --
 package/lua-msgpack-native/Config.in          | 12 ----------
 .../lua-msgpack-native.hash                   |  2 --
 .../lua-msgpack-native/lua-msgpack-native.mk  | 22 -------------------
 package/orbit/Config.in                       | 15 -------------
 package/orbit/orbit.hash                      |  4 ----
 package/orbit/orbit.mk                        | 14 ------------
 9 files changed, 14 insertions(+), 72 deletions(-)
 delete mode 100644 package/lua-msgpack-native/Config.in
 delete mode 100644 package/lua-msgpack-native/lua-msgpack-native.hash
 delete mode 100644 package/lua-msgpack-native/lua-msgpack-native.mk
 delete mode 100644 package/orbit/Config.in
 delete mode 100644 package/orbit/orbit.hash
 delete mode 100644 package/orbit/orbit.mk

-- 
2.20.1
