From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  2 Jan 2014 22:06:39 +0000
Subject: [Buildroot] [PATCH 2/3] filemq: bump git snapshot
In-Reply-To: <1388700400-25062-1-git-send-email-spdawson@gmail.com>
References: <1388700400-25062-1-git-send-email-spdawson@gmail.com>
Message-ID: <1388700400-25062-3-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/filemq/filemq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 6f55573..8cf69bc 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = 8fac5140ddbca3c4742016795fbbf1d6579902f3
+FILEMQ_VERSION = c398c096a427d341e9323d7673e6e0ca5e43902a
 FILEMQ_SITE = git://github.com/zeromq/filemq.git
 
 FILEMQ_AUTORECONF = YES
-- 
1.8.3.2
