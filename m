From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:27:44 +0200
Subject: [Buildroot] [git commit] luaexpat: add LICENSE_FILES
Message-ID: <20170906203033.8107D8215C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d71a282652cd28b841a2944f78201dbaac500a46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luaexpat/luaexpat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index c6768dc..c7377f6 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -7,5 +7,6 @@
 LUAEXPAT_VERSION = 1.3.0-1
 LUAEXPAT_DEPENDENCIES = expat
 LUAEXPAT_LICENSE = MIT
+LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
