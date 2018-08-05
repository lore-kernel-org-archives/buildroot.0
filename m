From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun,  5 Aug 2018 16:05:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: bump to version 5.12.0.301
In-Reply-To: <1533477904-31216-1-git-send-email-angelo@amarulasolutions.com>
References: <1533477904-31216-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1533477904-31216-2-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bump mono to version 5.12.0.301

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mono/mono.hash | 2 +-
 package/mono/mono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 2cde7b6..b4911a6 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256 f0636baa0c1399805526142e799cb697ddccf736e506cf1a30a870eaa2830a89  mono-5.12.0.226.tar.bz2
+sha256 100d4ea7ac3e4a26740e0f284344272d6c5dcfef5c6e21e500d59b64814dcfbf  mono-5.12.0.301.tar.bz2
 sha256 3b40a54878b5ac2767a764bd082f8772ab27c03b9da9c7328c4c4935725556f7  LICENSE
 sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
 sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index d1fe9bb..bb851d5 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 5.12.0.226
+MONO_VERSION = 5.12.0.301
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
-- 
2.7.4
