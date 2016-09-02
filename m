From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Sep 2016 23:05:35 +0200
Subject: [Buildroot] [git commit] agentpp: bump to 4.0.6
Message-ID: <20160902210543.74F5982539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15cf25114a4918bab0bf7a5d5cd198f864c02929
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/agentpp/agentpp.hash | 2 +-
 package/agentpp/agentpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 6b992f9..eb36b0f 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 d473b98d5f08e572b474c375c11ff1c4c5323824eb721c3979b6c5258b72949d agent++-4.0.4.tar.gz
+sha256 913013000d685c8a6459dc0b862a85336c757c481b9aed99174a19788c719f36  agent++-4.0.6.tar.gz
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 7b1edec..55f2324 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.0.4
+AGENTPP_VERSION = 4.0.6
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
