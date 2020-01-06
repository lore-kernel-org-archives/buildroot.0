From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 20:45:54 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-oauth2: bump to version
 0.6.5
Message-ID: <20200106201550.272848EE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3381a7fdcb652abec0aeb74db29d9cb96f36cf6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-oauth2/erlang-p1-oauth2.hash | 2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
index 58756c6fd7..1a4211c1d2 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d7d954376ae7c131a0884c7c80b0b9e8270b6f574182df59ce4f2fbbae322854 erlang-p1-oauth2-0.6.3.tar.gz
+sha256 55bf54133ce0882fab59f813ddf9ed4dac1e051a53fb4bd1c0565136ebb4d6ac erlang-p1-oauth2-0.6.5.tar.gz
diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
index 444bc8971b..ea7c23a517 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_OAUTH2_VERSION = 0.6.3
+ERLANG_P1_OAUTH2_VERSION = 0.6.5
 ERLANG_P1_OAUTH2_SITE = $(call github,processone,p1_oauth2,$(ERLANG_P1_OAUTH2_VERSION))
 ERLANG_P1_OAUTH2_LICENSE = MIT
 ERLANG_P1_OAUTH2_LICENSE_FILES = LICENSE
