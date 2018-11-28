From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:37:48 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-tls: bump to version
 1.0.25
Message-ID: <20181202071600.5EB43815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c4290c3860747eeb423e83a52b7f7bd973d0b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index b5b800b202..af635e5221 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ca9670b7f78a025b101e3fee6255d7472d6b52abc46444cc45616c3d1bd75b9b erlang-p1-tls-1.0.17.tar.gz
+sha256 5bb883b03514999876c750cdb08a5e4cf80a9eb89319037b612e1265c43f6f6d erlang-p1-tls-1.0.25.tar.gz
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index ad7317dc8c..b569664465 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.0.17
+ERLANG_P1_TLS_VERSION = 1.0.25
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
