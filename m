From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 May 2010 14:35:04 +0200
Subject: [Buildroot] [git commit master] Add a show-targets target
Message-ID: <20100527123559.C259A12E2B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7d6c8ad0f786552e21d91d97ad4221ebc43876f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index a4bf4b5..ec2ec36 100644
--- a/Makefile
+++ b/Makefile
@@ -449,6 +449,9 @@ external-deps:
 	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
 		SPIDER=--spider source
 
+show-targets:
+	@echo $(TARGETS)
+
 ifeq ($(BR2_CONFIG_CACHE),y)
 # drop configure cache if configuration is changed
 $(BUILD_DIR)/tgt-config.cache: .config
-- 
1.6.3.3
