From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jul 2020 23:17:49 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/znc: security
 bump version to 1.8.1
Message-ID: <20200712211452.7F92C860D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=453be3363c0382dff39fa5dceaef2e38a0875353
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Changelog: https://wiki.znc.in/ChangeLog/1.8.1

Fixes CVE-2020-13775.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3a924b350d6214cd89037b82f198b401df749cf1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 137829ee52..2f6c7d51de 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  94fdb227c1afa3abff468e0b7b1309120ad99d6aa64c4fd35bef02928171bd54  znc-1.8.0.tar.gz
+sha256  3195f7614a800a843af12271593d39cd3eb40c15657cce56d9cf28754cd86141  znc-1.8.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 95302071e1..1c95397c65 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.8.0
+ZNC_VERSION = 1.8.1
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
