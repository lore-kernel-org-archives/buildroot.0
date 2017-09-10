From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Sep 2017 18:54:44 +0200
Subject: [Buildroot] [PATCH 2/3] package/zeromq: bump version to 4.1.6
In-Reply-To: <20170910165445.11424-1-bernd.kuhls@t-online.de>
References: <20170910165445.11424-1-bernd.kuhls@t-online.de>
Message-ID: <20170910165445.11424-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zeromq/zeromq.hash | 4 ++--
 package/zeromq/zeromq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 76067d93f..486656e42 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,4 +1,4 @@
 # From https://github.com/zeromq/zeromq4-1/releases
-sha1	2b7490b77860be3060b1b1f92cd73184d309ca69	zeromq-4.1.5.tar.gz
+sha1 b956df8c6f77c174683b51fbee67f99c94945651  zeromq-4.1.6.tar.gz
 # Calculated based on the hash above
-sha256	04aac57f081ffa3a2ee5ed04887be9e205df3a7ddade0027460b8042432bdbcf	zeromq-4.1.5.tar.gz
+sha256 02ebf60a43011e770799336365bcbce2eb85569e9b5f52aa0d8cc04672438a0a  zeromq-4.1.6.tar.gz
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 1d3be4ee3..caf564371 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.1.5
+ZEROMQ_VERSION = 4.1.6
 ZEROMQ_SITE = https://github.com/zeromq/zeromq4-1/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
-- 
2.11.0
