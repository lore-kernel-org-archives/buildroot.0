From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Aug 2019 18:45:56 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/apr: bump version to 1.7.0
Message-ID: <20190825164556.18841-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: http://www.apache.org/dist/apr/CHANGES-APR-1.7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr/apr.hash | 4 ++--
 package/apr/apr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index be130a5d78..e8b8501700 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,4 +1,4 @@
-# From http://www.apache.org/dist/apr/apr-1.6.3.tar.bz2.sha256
-sha256 131f06d16d7aabd097fa992a33eec2b6af3962f93e6d570a9bd4d85e95993172  apr-1.6.3.tar.bz2
+# From http://archive.apache.org/dist/apr/apr-1.7.0.tar.bz2.sha256
+sha256 e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a952f94f5a14436f7ea  apr-1.7.0.tar.bz2
 # Locally calculated
 sha256 f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 8f29e57c59..2a57f854f9 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.6.3
+APR_VERSION = 1.7.0
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
-- 
2.20.1
