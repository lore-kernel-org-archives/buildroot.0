From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jul 2020 21:46:58 +0200
Subject: [Buildroot] [git commit] package/libolm: bump to version 3.1.5
Message-ID: <20200726194558.2053688988@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd05db0e40e9804f237b4c41147db2be14de5d3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated hash file indentation (two spaces)

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libolm/libolm.hash | 4 ++--
 package/libolm/libolm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
index 613dda3544..f521d30c0b 100644
--- a/package/libolm/libolm.hash
+++ b/package/libolm/libolm.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 1ca9926ce71d778fb7352d1ee77513194db8c7f49c0d69d38ac49ec3bafcea38 olm-3.1.4.tar.gz
-sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594 LICENSE
+sha256  92ac1eccacbff620a1bc1a168ba204893d83bcb72646e456990ebe2480638696  olm-3.1.5.tar.gz
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
index 78ee05b3c2..48cb31fb29 100644
--- a/package/libolm/libolm.mk
+++ b/package/libolm/libolm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOLM_VERSION = 3.1.4
+LIBOLM_VERSION = 3.1.5
 LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
 LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
 LIBOLM_LICENSE = Apache-2.0
