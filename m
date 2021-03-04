From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:09:59 +0100
Subject: [Buildroot] [git commit] package/libstrophe: bump to version 0.10.1
Message-ID: <20210304065255.1251086DAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28c7ff0bdb602e75d2891818ff87fe7fd4ed0015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
* Fixed compilation error when LibreSSL is used
* Fixed crash when NULL is provided as password

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libstrophe/libstrophe.hash | 2 +-
 package/libstrophe/libstrophe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index 5f3b098c89..6aca289fb5 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 8d804e4c74cea1133203cc95a59a88f700fbdaead076e7959b495d734dd7936d  libstrophe-0.10.0.tar.gz
+sha256 4918c47029ecdea2deab4b0f9336ca4a8bb12c28b72b2cec397d98664b94c771  libstrophe-0.10.1.tar.gz
 sha256 82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 81fc1b9f97..e078eb25cd 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.10.0
+LIBSTROPHE_VERSION = 0.10.1
 LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
 LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
 # Doesn't ship configure
