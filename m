From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Apr 2021 20:41:09 +0200
Subject: [Buildroot] [git commit] package/execline: bump to version 2.8.0.0
Message-ID: <20210407181658.C64D382205@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf66772c9b089dfcd67e1abbe04d7db52562310a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1535:lpehbljhhcpaopbnkkbf

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/execline/execline.hash | 2 +-
 package/execline/execline.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index ac6239e86d..935f5111f7 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a24c76f097ff44fe50b63b89bcde5d6ba9a481aecddbe88ee01b0e5a7b314556  execline-2.6.1.0.tar.gz
+sha256  e7744b4a400eda68b83dcfb1bce65e454606279882d83d8230ddf8afda25766d  execline-2.8.0.0.tar.gz
 sha256  5443ac67e8d74ac614ced7bc64211ce90ccedb7778a68bfe9e68a8b234c9503e  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index e2423e9536..0ab5a03f2e 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.6.1.0
+EXECLINE_VERSION = 2.8.0.0
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
