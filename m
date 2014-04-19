From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Apr 2014 22:57:52 +0200
Subject: [Buildroot] [PATCH 0/8] update of some Lua modules
Message-ID: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois Perrad (8):
  cosmo: bump to version 14.03.04
  coxpcall: bump to version 1.15.0
  luajson: bump to version 1.3.3
  orbit: bump to version 2.2.1
  wsapi: bump to version 1.6.1
  cgilua: bump rockspec revision
  luafilesystem: bump rockspec revision
  luacrypto: luarocks conversion

 package/cgilua/cgilua.mk                       |  2 +-
 package/cosmo/cosmo.mk                         |  2 +-
 package/coxpcall/coxpcall.mk                   |  4 ++--
 package/luacrypto/luacrypto-01-autotools.patch | 30 --------------------------
 package/luacrypto/luacrypto.mk                 | 12 +++++------
 package/luafilesystem/luafilesystem.mk         |  2 +-
 package/luajson/luajson.mk                     |  2 +-
 package/orbit/orbit.mk                         |  6 +++---
 package/wsapi/wsapi.mk                         |  2 +-
 9 files changed, 16 insertions(+), 46 deletions(-)
 delete mode 100644 package/luacrypto/luacrypto-01-autotools.patch

-- 
1.9.1
