From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:49:42 +0200
Subject: [Buildroot] [git commit] agentpp: bump to 4.0.4
Message-ID: <20150621044945.F218A804F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50e57ec0e865fc3736e8defcaa313438dbc43c24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/agentpp/agentpp.hash |    2 +-
 package/agentpp/agentpp.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 7c48044..6b992f9 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha512 636e19a7bbc3cfbf6f1ac10d29ddd378ca81b5525be1bd09c26a1cbd20ff9cfc3d4406329147bf20994f0d59bbdb675e99e82de3837eb898a145439c5054ef96 agent++-4.0.3.tar.gz
+sha256 d473b98d5f08e572b474c375c11ff1c4c5323824eb721c3979b6c5258b72949d agent++-4.0.4.tar.gz
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 29d809e..7b1edec 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.0.3
+AGENTPP_VERSION = 4.0.4
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
