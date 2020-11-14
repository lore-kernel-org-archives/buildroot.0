From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:12:20 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/fbset: add
 license file
Message-ID: <20201114125939.5757281841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c86092c8bf5838a40b671fdbacae4a9961e70107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Use fbset.c as the license file and, while at it, also update
indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1379ef161bb95636aa5b0f7666cdaa3dbefe11d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbset/fbset.hash | 3 ++-
 package/fbset/fbset.mk   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/fbset/fbset.hash b/package/fbset/fbset.hash
index ca8cc6d1f0..5d9785d90a 100644
--- a/package/fbset/fbset.hash
+++ b/package/fbset/fbset.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	40ff4ab0247b75138a0887ed40f81c1a6184f340b77126c16d074b1075b41c20	fbset-2.1.tar.gz
+sha256  40ff4ab0247b75138a0887ed40f81c1a6184f340b77126c16d074b1075b41c20  fbset-2.1.tar.gz
+sha256  c3285709a0840899a789faefae1704e87f96f757e905a38a1931a9d4fde95ddd  fbset.c
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 787b4e1dca..8d2a477f8b 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -8,6 +8,7 @@ FBSET_VERSION = 2.1
 FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
 FBSET_DEPENDENCIES = host-bison host-flex
 FBSET_LICENSE = GPL-2.0
+FBSET_LICENSE_FILES = fbset.c
 
 define FBSET_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
