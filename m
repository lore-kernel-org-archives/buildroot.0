From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 23:24:33 +0100
Subject: [Buildroot] [git commit branch/next] package/erlang-p1-pkix: bump
 version to 1.0.6
Message-ID: <20201201221510.5C46F81682@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbe2c34083a8f77b240f2a613c1670d10626a688
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-pkix/erlang-p1-pkix.hash | 4 ++--
 package/erlang-p1-pkix/erlang-p1-pkix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.hash b/package/erlang-p1-pkix/erlang-p1-pkix.hash
index b11340b873..b0ee7d58ba 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.hash
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 184069d9055991cb8b7bd07dde8737a0a793e66e1ec1020deb680f83260a3e82 erlang-p1-pkix-1.0.4.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
+sha256  3a39c4ca74f93efa0e4de4c37f9e4d073b1aeb142ad669f12588ad2b3c39724e  erlang-p1-pkix-1.0.6.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.mk b/package/erlang-p1-pkix/erlang-p1-pkix.mk
index 9f902d44bb..12ae042138 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.mk
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_PKIX_VERSION = 1.0.4
+ERLANG_P1_PKIX_VERSION = 1.0.6
 ERLANG_P1_PKIX_SITE = $(call github,processone,pkix,$(ERLANG_P1_PKIX_VERSION))
 ERLANG_P1_PKIX_LICENSE = Apache-2.0
 ERLANG_P1_PKIX_LICENSE_FILES = LICENSE
