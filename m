From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:38:05 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-yaml: bump to version
 1.0.17
Message-ID: <20181202071600.86AE8803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdaf54e2224d0257aa57a4029c471985afaf33ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-yaml/erlang-p1-yaml.hash | 2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
index 24282e6c37..2f3b181f6a 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5a6499a47cdd1f753a527cb8b79074312354063535adc0ca0fd7f72c2a015e3a erlang-p1-yaml-1.0.12.tar.gz
+sha256 d2675ec9b2f64eba6c3437597e3abe3bfaae2172560784456a2763d1d1a50b08 erlang-p1-yaml-1.0.17.tar.gz
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
index de138a9f93..d4173988f3 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YAML_VERSION = 1.0.12
+ERLANG_P1_YAML_VERSION = 1.0.17
 ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
 ERLANG_P1_YAML_LICENSE = Apache-2.0
 ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
