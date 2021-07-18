From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 22:41:37 +0200
Subject: [Buildroot] [git commit] package/icu: bump version to 69-1
Message-ID: <20210718200905.B492E882A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=d6fefd4f21b0d000caf3221846907ea2754bf3b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: http://site.icu-project.org/download/69

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/icu/icu.hash | 2 +-
 package/icu/icu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 80cdd7df0c..5ed7cc4217 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb29f2d  icu4c-68_1-src.tgz
+sha256  4cba7b7acd1d3c42c44bb0c14be6637098c7faf2b330ce876bc5f3b915d09745  icu4c-69_1-src.tgz
 sha256  7915b19db903070778581ae05d8bf4ea241b34a05deb51ca4f5cbb15ea1cbba3  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 4d67831c76..0a17c61462 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 68-1
+ICU_VERSION = 69-1
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
