From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 20:46:58 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-tls: bump to version
 1.1.2
Message-ID: <20200106201550.420698EE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1feb9ef02b5afb9308ef1faf6ceed2a2f82caff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index af635e5221..5933f3e22f 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5bb883b03514999876c750cdb08a5e4cf80a9eb89319037b612e1265c43f6f6d erlang-p1-tls-1.0.25.tar.gz
+sha256 6444e174650054a53624490155a914b8bea31cdefbcd5f87fc1862102dc1db6e erlang-p1-tls-1.1.2.tar.gz
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index b569664465..824fe41ec1 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.0.25
+ERLANG_P1_TLS_VERSION = 1.1.2
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
