From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 20 Mar 2017 20:41:19 +0530
Subject: [Buildroot] [PATCH 3/3] filemq: bump version to
	3dc89932903b0320853d87833aabc6f7e7781c49
In-Reply-To: <1490022679-28301-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1490022679-28301-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1490022679-28301-3-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump removes (L)GPLv3 license text which were leftover
from previous implementation.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/filemq/filemq.hash | 2 +-
 package/filemq/filemq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/filemq/filemq.hash b/package/filemq/filemq.hash
index 1a7997e..d76d009 100644
--- a/package/filemq/filemq.hash
+++ b/package/filemq/filemq.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c373eddd5154cfe63f6cc6b3255ec20dca1f70c1f1881b611930931df47babad  filemq-e59951489045825d6fc5bdc6a5a5ecf1abf51943.tar.gz
+sha256 a9973117f8afea6d4cbde95e4d7f46ab90d67cb0d72e42165410d665bf1765c1  filemq-3dc89932903b0320853d87833aabc6f7e7781c49.tar.gz
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 62ddfaf..2eadc5d 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = e59951489045825d6fc5bdc6a5a5ecf1abf51943
+FILEMQ_VERSION = 3dc89932903b0320853d87833aabc6f7e7781c49
 FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
-- 
2.6.2
