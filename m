From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 23:24:34 +0100
Subject: [Buildroot] [git commit branch/next] package/erlang-p1-yaml: bump
 version to 1.0.28
Message-ID: <20201201221510.8908481682@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8a140592df64ae1d9f44af23ce890793e6db6ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-yaml/erlang-p1-yaml.hash | 4 ++--
 package/erlang-p1-yaml/erlang-p1-yaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
index 116363203c..955a000930 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b915612c06ef190bfed6d0370906b071274ed4ce4143b668cdad66588a9484a0 erlang-p1-yaml-1.0.21.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
+sha256  8f53308438e4d1613562acb586b4c4540569d8305097508c40e6f261fe4216cd  erlang-p1-yaml-1.0.28.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
index 6836c3f557..e42ff5fe38 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YAML_VERSION = 1.0.21
+ERLANG_P1_YAML_VERSION = 1.0.28
 ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
 ERLANG_P1_YAML_LICENSE = Apache-2.0
 ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
