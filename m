From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:29 +0100
Subject: [Buildroot] [PATCH 07/25] luasec: remove LUASEC_VERSION_UPSTREAM
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-8-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is not used for anything.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luasec/luasec.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index fd1f1cdbb7..b059e1c6ee 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION_UPSTREAM = 0.5
-LUASEC_VERSION = $(LUASEC_VERSION_UPSTREAM)-2
+LUASEC_VERSION = 0.5-2
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
-- 
2.11.0
