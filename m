From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Apr 2021 10:31:27 +0200
Subject: [Buildroot] [git commit] package/isl: bump to version 0.23
Message-ID: <20210410080609.E77FF829FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68c7be9c284779429dd7d2de5055b626ea6bb212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://repo.or.cz/isl.git/blob/8cec80451ea4f2f225629527b99ee2dc54ac2cad:/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/isl/isl.hash | 4 ++--
 package/isl/isl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index 40d04dca80..3df331b143 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	6c8bc56c477affecba9c59e2c9f026967ac8bad01b51bdd07916db40a517b9fa	isl-0.22.tar.xz
-sha256	3a2c398103f6bca0f50a9a9465deca9230b370b0212af5fdf31ed88a36215c30	LICENSE
+sha256  5efc53efaef151301f4e7dde3856b66812d8153dede24fab17673f801c8698f2  isl-0.23.tar.xz
+sha256  3a2c398103f6bca0f50a9a9465deca9230b370b0212af5fdf31ed88a36215c30  LICENSE
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index a1a597d038..3abd6640cb 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ISL_VERSION = 0.22
+ISL_VERSION = 0.23
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = http://isl.gforge.inria.fr
 ISL_LICENSE = MIT
