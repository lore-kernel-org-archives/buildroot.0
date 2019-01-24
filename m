From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:28:13 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/gnuchess: license
 is GPL-3.0+, not GPL-2.0+
Message-ID: <20190124152737.99AED83DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af993e068477df5fbf3c86dfedf3692ce04a9412
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

gnuchess is licensed under GPL-3.0+ not GPL-2.0+, also add hash for
license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ef25d13fc7c9769de6a5ea0f45e83510821fe3e5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuchess/gnuchess.hash | 1 +
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index 064a845eda..e0a1c4c418 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,2 +1,3 @@
 # sha256 locally computed
 sha256 3c425c0264f253fc5cc2ba969abe667d77703c728770bd4b23c456cbe5e082ef  gnuchess-6.2.4.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 1465ab0a00..0abdab5ba5 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -6,7 +6,7 @@
 
 GNUCHESS_VERSION = 6.2.4
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
-GNUCHESS_LICENSE = GPL-2.0+
+GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
 
 GNUCHESS_DEPENDENCIES = host-flex flex
