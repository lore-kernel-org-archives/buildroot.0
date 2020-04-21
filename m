From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:35:43 +0200
Subject: [Buildroot] [git commit] package/tini: bump to 0.19.0
Message-ID: <20200421192149.4A0C38FA94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ceda5fb107987511a97d022370e48d804a1cd95a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tini/tini.hash | 4 ++--
 package/tini/tini.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tini/tini.hash b/package/tini/tini.hash
index 7c548183b6..83a97a40a3 100644
--- a/package/tini/tini.hash
+++ b/package/tini/tini.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	e5f46bca81266bdd511cf08018d66866870531794569c04f9b45f50dd23c28b0	LICENSE
-sha256	1097675352d6317b547e73f9dc7c6839fd0bb0d96dafc2e5c95506bb324049a2  tini-0.18.0.tar.gz
+sha256  e5f46bca81266bdd511cf08018d66866870531794569c04f9b45f50dd23c28b0  LICENSE
+sha256  0fd35a7030052acd9f58948d1d900fe1e432ee37103c5561554408bdac6bbf0d  tini-0.19.0.tar.gz
diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index 986e612a83..157477f8df 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINI_VERSION = 0.18.0
+TINI_VERSION = 0.19.0
 TINI_SITE = $(call github,krallin,tini,v$(TINI_VERSION))
 TINI_LICENSE = MIT
 TINI_LICENSE_FILES = LICENSE
