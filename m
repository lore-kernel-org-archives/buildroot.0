From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Sep 2016 14:22:52 +0200
Subject: [Buildroot] [PATCH 2/2] agentpp: bump to 4.0.6
In-Reply-To: <1472818972-18866-1-git-send-email-luca@lucaceresoli.net>
References: <1472818972-18866-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1472818972-18866-2-git-send-email-luca@lucaceresoli.net>
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
index 6b992f9..eb36b0f 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 d473b98d5f08e572b474c375c11ff1c4c5323824eb721c3979b6c5258b72949d agent++-4.0.4.tar.gz
+sha256 913013000d685c8a6459dc0b862a85336c757c481b9aed99174a19788c719f36  agent++-4.0.6.tar.gz
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 7b1edec..55f2324 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.0.4
+AGENTPP_VERSION = 4.0.6
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
-- 
2.7.4
