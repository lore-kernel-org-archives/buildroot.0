From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 26 Sep 2017 15:59:09 +0200
Subject: [Buildroot] [PATCH] package/mono: bump to version 5.2.0.224
Message-ID: <1506434349-4636-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps mono to version 5.2.0.224 and the required monolite
dependency to 1050200001.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.hash         | 2 +-
 package/mono/mono.mk           | 2 +-
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 5d14a52..9af7ce3 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 48d6ae71d593cd01bf0f499de569359d45856cda325575e1bacb5fabaa7e9718  mono-5.0.1.1.tar.bz2
+sha256 03b8e463032bc425673dec844b35b4c669f5b99b0e45521195efb3741a9f5e94  mono-5.2.0.224.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index ec2f38f..838963d 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 5.0.1.1
+MONO_VERSION = 5.2.0.224
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 7638ce2..0d4fff8 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 365dc589e6d336530ef8efaa491e932c15163f449632daef6c41bed770d9fe53  monolite-1050001000-latest.tar.gz
+sha256 56f313da5f7137fae86db6af1476df0cf6515cedea46369347c4159ed7ce3300  monolite-1050200001-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index a2815ef..78e698a 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 1050001000
+MONOLITE_VERSION = 1050200001
 MONOLITE_SITE = http://download.mono-project.com/monolite/
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
-- 
2.7.4
