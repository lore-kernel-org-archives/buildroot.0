From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-yaml: bump to version
 1.0.21
Message-ID: <20200106201550.720698EE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ec2423ea639343a0458bc8e776c376985d09946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-yaml/erlang-p1-yaml.hash | 2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
index 2f3b181f6a..4f4c489cf1 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d2675ec9b2f64eba6c3437597e3abe3bfaae2172560784456a2763d1d1a50b08 erlang-p1-yaml-1.0.17.tar.gz
+sha256 b915612c06ef190bfed6d0370906b071274ed4ce4143b668cdad66588a9484a0 erlang-p1-yaml-1.0.21.tar.gz
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
index d4173988f3..6836c3f557 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YAML_VERSION = 1.0.17
+ERLANG_P1_YAML_VERSION = 1.0.21
 ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
 ERLANG_P1_YAML_LICENSE = Apache-2.0
 ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
