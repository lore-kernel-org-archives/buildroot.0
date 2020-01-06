From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 20:44:46 +0100
Subject: [Buildroot] [git commit] package/erlang-lager: bump to version
 3.6.10
Message-ID: <20200106201550.0B7AB8EE9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01c6c72f7e1cbe5d3aa374c81c6c70494ee0f269
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-lager/erlang-lager.hash | 2 +-
 package/erlang-lager/erlang-lager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-lager/erlang-lager.hash b/package/erlang-lager/erlang-lager.hash
index 144cef6d3d..26bfabbdea 100644
--- a/package/erlang-lager/erlang-lager.hash
+++ b/package/erlang-lager/erlang-lager.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c5f532dd236e07dad27976abcf12b9c90fcf33ffd6fe1b1d34639c06171c36ea erlang-lager-3.4.2.tar.gz
+sha256 c5bb4ba6f918e90d2e6671c3996d72c61f2a589b65c151b3df8011d046362981 erlang-lager-3.6.10.tar.gz
diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
index 790288a460..a698bce8d5 100644
--- a/package/erlang-lager/erlang-lager.mk
+++ b/package/erlang-lager/erlang-lager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_LAGER_VERSION = 3.4.2
+ERLANG_LAGER_VERSION = 3.6.10
 ERLANG_LAGER_SITE = $(call github,erlang-lager,lager,$(ERLANG_LAGER_VERSION))
 ERLANG_LAGER_LICENSE = Apache-2.0
 ERLANG_LAGER_LICENSE_FILES = LICENSE
