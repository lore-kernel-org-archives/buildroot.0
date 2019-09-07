From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Sep 2019 17:00:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/agentpp: bump to version 4.1.2
In-Reply-To: <20190907150043.28449-1-fontaine.fabrice@gmail.com>
References: <20190907150043.28449-1-fontaine.fabrice@gmail.com>
Message-ID: <20190907150043.28449-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/agentpp/agentpp.hash | 3 ++-
 package/agentpp/agentpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 131edc4a17..f458190720 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 6775fa2a038801edddedc148d7846427ddc4d438e3bb33362d9eec6074918a88  agent++-4.0.7.tar.gz
+sha256 ffbd06e6582978b6ea7344ae0ccfe58e634b84d31496bb6eb77f0a9e8f1e1df1  agent++-4.1.2.tar.gz
+sha256 1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 12cf2089e9..0b6ef0a2a7 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.0.7
+AGENTPP_VERSION = 4.1.2
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
-- 
2.23.0.rc1
