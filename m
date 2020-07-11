From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 00:10:12 +0200
Subject: [Buildroot] [git commit] package/agentpp: bump version to 4.3.1
Message-ID: <20200711220657.ABCA886875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88355e967fef53a6c4ad1f2fb1f1c83413c3e8b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/agentpp/agentpp.hash | 4 ++--
 package/agentpp/agentpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index f458190720..11b23c8ee2 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 ffbd06e6582978b6ea7344ae0ccfe58e634b84d31496bb6eb77f0a9e8f1e1df1  agent++-4.1.2.tar.gz
-sha256 1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
+sha256  9b45123df45e803198a1181540b37a4ccd0e63c68df6e826702e2ba49167edac  agent++-4.3.1.tar.gz
+sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 0b6ef0a2a7..8982d9e564 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.1.2
+AGENTPP_VERSION = 4.3.1
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
