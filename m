From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 22:53:44 +0100
Subject: [Buildroot] [git commit] jquery: bump to version 1.11.2
Message-ID: <20141218220056.43460804FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=927f8d26908960365a7315eef1662b2f5e10a561
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jquery/jquery.hash |    2 ++
 package/jquery/jquery.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/jquery/jquery.hash b/package/jquery/jquery.hash
new file mode 100644
index 0000000..ec43e7c
--- /dev/null
+++ b/package/jquery/jquery.hash
@@ -0,0 +1,2 @@
+# Locally computed hashes, not provided by upstream
+sha256	2ecd295d295bec062cedebe177e54b9d6b19fc0a841dc5c178c654c9ccff09c0	jquery-1.11.2.min.js
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 17d3e8b..363ee09 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_VERSION = 1.11.1
+JQUERY_VERSION = 1.11.2
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 JQUERY_LICENSE = MIT
