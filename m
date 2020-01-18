From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 13:53:35 +0100
Subject: [Buildroot] [git commit] package/mono: bump to version 6.0.0.313
Message-ID: <20200118124339.53CA882670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c8a285b6e35c4028341f874760bfa9226ebff94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps mono to version 6.8.0.96 and its related dependency
monolite to version ABB721D6-116A-4555-B4FD-9248146D2051.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mono/mono.hash         | 2 +-
 package/mono/mono.mk           | 2 +-
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 6fcf26beae..fa5333867c 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256 a946e91d7da3f90b5e7cbbdf27adfa2f57ddb09b199dfc4d6d3bc05eb0690c50  mono-6.0.0.313.tar.xz
+sha256 ed5df4ec663a4e228e89e910e954fa18d33f72e790c11174e1b62fc8cca90ba0  mono-6.8.0.96.tar.xz
 sha256 923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
 sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
 sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index a65963a259..274d9817e5 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 6.0.0.313
+MONO_VERSION = 6.8.0.96
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 1fc0d758cc..bd953591b4 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 21f0dada9f866e8e90c4884cef08d738f9addbe99b66a4b0d442f25ea0841abe  monolite-linux-d0aa6798-834d-11e9-b38a-3b0d70487d01-latest.tar.gz
+sha256 4b75a73bb4a99b8e3b51837afb72192cce27b482cb5ec70cc136b293071f902e  monolite-linux-ABB721D6-116A-4555-B4FD-9248146D2051-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 262ed06c4d..b9e3990c42 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = d0aa6798-834d-11e9-b38a-3b0d70487d01
+MONOLITE_VERSION = ABB721D6-116A-4555-B4FD-9248146D2051
 MONOLITE_SITE = http://download.mono-project.com/monolite
 MONOLITE_SOURCE = monolite-linux-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
