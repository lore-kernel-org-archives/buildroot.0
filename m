From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:32:56 +0100
Subject: [Buildroot] [git commit] erlang-p1-tls: Bump to version 1.0.17
Message-ID: <20180117213347.3A3C883F1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb3f30f9809dcbe1a7b6cb8cbbd30d09383a37b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index eb707f1..b5b800b 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c42237e5dd231c558b48633788a0e9ca55b4f3b5bc4692107fee031a8f91cda3 erlang-p1-tls-1.0.11.tar.gz
+sha256 ca9670b7f78a025b101e3fee6255d7472d6b52abc46444cc45616c3d1bd75b9b erlang-p1-tls-1.0.17.tar.gz
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index 63d0112..ad7317d 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.0.11
+ERLANG_P1_TLS_VERSION = 1.0.17
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
