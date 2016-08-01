From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 22:38:38 +0200
Subject: [Buildroot] [git commit] package/luvi: bump to version 2.7.5
Message-ID: <20160801203856.A30CD802A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d5dea41384c09fa4de146036c799db524cbc785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luvi/luvi.hash | 2 +-
 package/luvi/luvi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 313aef6..99fd69e 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  74d52e99174af46aebcf30e26bf5783df8fa3117f54792391bfef4d9c79c4e60  luvi-src-v2.7.2.tar.gz
+sha256  b36a3b96ec5852398338bc38567c5bb589783487c65130e1d702ff98fac3a6b7  luvi-src-v2.7.5.tar.gz
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 7506a8b..ade63f5 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.7.2
+LUVI_VERSION = v2.7.5
 LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
