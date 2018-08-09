From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 22:40:12 +0200
Subject: [Buildroot] [git commit branch/next] package/mono: bump to version
 5.14.0.177
Message-ID: <20180809203350.59A8E8B748@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10cb36ce95b602837cf9100b38a91868edc3b3ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps mono to version 5.14.0.177

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mono/mono.hash         | 2 +-
 package/mono/mono.mk           | 2 +-
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index b4911a6de6..db7ce52c97 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256 100d4ea7ac3e4a26740e0f284344272d6c5dcfef5c6e21e500d59b64814dcfbf  mono-5.12.0.301.tar.bz2
+sha256 d4f5fa2e8188d66fbc8054f4145711e45c1faa6d070e63600efab93d1d189498  mono-5.14.0.177.tar.bz2
 sha256 3b40a54878b5ac2767a764bd082f8772ab27c03b9da9c7328c4c4935725556f7  LICENSE
 sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
 sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index bb851d5932..62eaeaf8b4 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 5.12.0.301
+MONO_VERSION = 5.14.0.177
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 77810a9511..cf72916855 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 fece21adc06118fa5d79d3621a5fc702ec354abf83be29a36f8718645a2dc058  monolite-linux-1051200002-latest.tar.gz
+sha256 bb4b3b12b9ff04b219ad00dcea78145475d756a1c22ad84e0db978a8eee8c654  monolite-linux-1051400005-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 4e1d548994..2e1e54a549 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 1051200002
+MONOLITE_VERSION = 1051400005
 MONOLITE_SITE = http://download.mono-project.com/monolite
 MONOLITE_SOURCE = monolite-linux-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
