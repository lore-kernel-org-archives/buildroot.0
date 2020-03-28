From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Mar 2020 19:28:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysstat: bump to version 12.2.1
Message-ID: <20200328182848.1608517-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysstat/sysstat.hash | 6 +++---
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index 3bbefac189..57fc8f181e 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,5 +1,5 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1 5300345489e455ac62547b072bb8531414758fdf  sysstat-11.6.3.tar.xz
+sha1  4da5a48d0152eba5b34d94bf28dcb08fc48fb32b  sysstat-12.2.1.tar.xz
 # Locally calculated
-sha256 54b306a1634e39710767936d4d1be17e8b65062aa04c837b41479c4b28b511bd  sysstat-11.6.3.tar.xz
-sha256 db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
+sha256  8edb0e19b514ac560a098a02933a4735b881296d61014db89bf80f05dd7a4732  sysstat-12.2.1.tar.xz
+sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 099374edab..5f03b6d9bd 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.6.3
+SYSSTAT_VERSION = 12.2.1
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-file-attr
-- 
2.25.1
