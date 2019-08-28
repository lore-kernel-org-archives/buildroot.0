From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 14:43:25 +0200
Subject: [Buildroot] [git commit] package/apr: bump version to 1.7.0
Message-ID: <20190903133622.E3C2F8A5E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85f4b77123e1a166eb0ecb4f8f94496be34d9f5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: http://www.apache.org/dist/apr/CHANGES-APR-1.7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr/apr.hash | 4 ++--
 package/apr/apr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index be130a5d78..0a3f5c8527 100644
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
