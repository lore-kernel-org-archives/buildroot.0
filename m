From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun,  5 Jul 2020 13:52:42 -0300
Subject: [Buildroot] [PATCH 2/2] package/agentpp: bump version to 4.3.1
In-Reply-To: <20200705165242.13930-1-sergio.prado@e-labworks.com>
References: <20200705165242.13930-1-sergio.prado@e-labworks.com>
Message-ID: <20200705165242.13930-3-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/agentpp/agentpp.hash | 4 ++--
 package/agentpp/agentpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index f45819072050..11b23c8ee2ec 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 ffbd06e6582978b6ea7344ae0ccfe58e634b84d31496bb6eb77f0a9e8f1e1df1  agent++-4.1.2.tar.gz
-sha256 1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
+sha256  9b45123df45e803198a1181540b37a4ccd0e63c68df6e826702e2ba49167edac  agent++-4.3.1.tar.gz
+sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 0b6ef0a2a7f0..8982d9e564be 100644
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
-- 
2.17.1
