From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  2 Jan 2014 22:06:38 +0000
Subject: [Buildroot] [PATCH 1/3] czmq: bump git snapshot
In-Reply-To: <1388700400-25062-1-git-send-email-spdawson@gmail.com>
References: <1388700400-25062-1-git-send-email-spdawson@gmail.com>
Message-ID: <1388700400-25062-2-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/czmq/czmq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index da68790..db8f727 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CZMQ_VERSION = cb9839cf90e4ac69acb7c6ff2b4e2d42d704cf6e
+CZMQ_VERSION = b5730c5f8290a611fd3b92e4a259c2b0ed96cb73
 CZMQ_SITE = git://github.com/zeromq/czmq.git
 
 # Autoreconf required as we use the git tree
-- 
1.8.3.2
