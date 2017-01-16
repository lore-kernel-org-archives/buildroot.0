From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 16 Jan 2017 09:34:20 +0100
Subject: [Buildroot] [PATCH 2/2] agentpp: bump to 4.0.7
In-Reply-To: <1484555660-14319-1-git-send-email-luca@lucaceresoli.net>
References: <1484555660-14319-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1484555660-14319-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/agentpp/agentpp.hash | 2 +-
 package/agentpp/agentpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index eb36b0f80f7a..131edc4a1716 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 913013000d685c8a6459dc0b862a85336c757c481b9aed99174a19788c719f36  agent++-4.0.6.tar.gz
+sha256 6775fa2a038801edddedc148d7846427ddc4d438e3bb33362d9eec6074918a88  agent++-4.0.7.tar.gz
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 55f2324319ae..12cf2089e9b8 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.0.6
+AGENTPP_VERSION = 4.0.7
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
-- 
2.7.4
