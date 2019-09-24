From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 24 Sep 2019 23:13:59 +0200
Subject: [Buildroot] [git commit] package/c-icap: bump to version 0.5.5
Message-ID: <20190924211011.AF92C8F388@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5aa04f332f2c615553d60d7d43c96278c343f41b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/c-icap/c-icap.hash | 3 ++-
 package/c-icap/c-icap.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/c-icap/c-icap.hash b/package/c-icap/c-icap.hash
index 2b083ef659..9a761175cf 100644
--- a/package/c-icap/c-icap.hash
+++ b/package/c-icap/c-icap.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 b138c7d7d9828d54c3307bcfe7b4917911266593832ffc26a60df9a0dfd2511e c_icap-0.4.2.tar.gz
+sha256 5eafc7775ecb3fe49545451eaa31f045716d0242977588c0ba27c2c1b4683d8a c_icap-0.5.5.tar.gz
+sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89 COPYING
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index c722098c59..8720cb16c9 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_VERSION = 0.4.2
+C_ICAP_VERSION = 0.5.5
 C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPL-2.1+
