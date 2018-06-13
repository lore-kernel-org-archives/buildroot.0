From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:25:45 +0200
Subject: [Buildroot] [git commit] package/unrar: bump version to 5.6.4
Message-ID: <20180613202338.6EA71884C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab9d39275c362650e734aef73124aa155d4ac33b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 81688d7b7d..95acb85763 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	9b66e4353a9944bc140eb2a919ff99482dd548f858f5e296d809e8f7cdb2fcf4	unrarsrc-5.5.8.tar.gz
+sha256	9335d2201870f2034007c04be80e00f1dc23932cb88b329d55c76134e6ba49fe	unrarsrc-5.6.4.tar.gz
 sha256	6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a	license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index d6c97dff2c..75e9329903 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.5.8
+UNRAR_VERSION = 5.6.4
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = http://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
