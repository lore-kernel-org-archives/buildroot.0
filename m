From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:04:01 +0200
Subject: [Buildroot] [git commit] package/lua-lyaml: bump to version 6.2.5
Message-ID: <20200417195137.082C28EF70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e26c87114b6f992b89a46b7ee48c6749b235633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
- Copyright (C) 2013-2019 Gary V. Vaughan
+ Copyright (C) 2013-2020 Gary V. Vaughan

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-lyaml/lua-lyaml.hash | 4 ++--
 package/lua-lyaml/lua-lyaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-lyaml/lua-lyaml.hash b/package/lua-lyaml/lua-lyaml.hash
index dd19783852..1881944252 100644
--- a/package/lua-lyaml/lua-lyaml.hash
+++ b/package/lua-lyaml/lua-lyaml.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 f4015ba47a389fc4fe0656cbcb8a216239275ec53309a0df79b0733c843e7bba  lua-lyaml-6.2.4.tar.gz
-sha256 c7ec2f52d258088437cddeeee38cfc97d60d464c8801aa77decefb993400ec6e  LICENSE
+sha256 16bbc8e3bf1ad3cf29bdefc24cd136959481ec03bd52da94c3c1f6fa5ae299ce  lua-lyaml-6.2.5.tar.gz
+sha256 81e4ea1d897e259b31111adc2d3c185fe23e435942ff3e9de8c8c9c5d01247d0  LICENSE
diff --git a/package/lua-lyaml/lua-lyaml.mk b/package/lua-lyaml/lua-lyaml.mk
index c88a438d5e..b16faeae6c 100644
--- a/package/lua-lyaml/lua-lyaml.mk
+++ b/package/lua-lyaml/lua-lyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LYAML_VERSION = 6.2.4
+LUA_LYAML_VERSION = 6.2.5
 LUA_LYAML_NAME_UPSTREAM = lyaml
 LUA_LYAML_SITE = $(call github,gvvaughan,$(LUA_LYAML_NAME_UPSTREAM),v$(LUA_LYAML_VERSION))
 LUA_LYAML_LICENSE = MIT
