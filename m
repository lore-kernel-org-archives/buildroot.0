From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue,  9 Jun 2020 09:31:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgit2: Bump to version 1.0.1
Message-ID: <20200609073146.2245-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 6e977a97e0..1cb12ea035 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6a1fa16a7f6335ce8b2630fbdbb5e57c4027929ebc56fcd1ac55edb141b409b4  libgit2-1.0.0.tar.gz
+sha256  689f442c39c4117df515d1a0ffd7b401b91a500d7e2875ac45a440d86f198f5a  libgit2-1.0.1.tar.gz
 sha256  afc8bde99ba630012107c25d3c42dde628ec5f0cd3f428131f7e3a0f7d58ff42  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 46cc4286c6..d674f17c7f 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.0.0
+LIBGIT2_VERSION = 1.0.1
 LIBGIT2_SITE = https://github.com/libgit2/libgit2/releases/download/v$(LIBGIT2_VERSION)
 LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
 LIBGIT2_LICENSE_FILES = COPYING
-- 
2.27.0.rc0
