From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:50:36 +0200
Subject: [Buildroot] [git commit] package/sysstat: bump to version 12.2.1
Message-ID: <20200329133716.B3B4988DA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0f5a5551ab86f6272f13deaa16dcdf4b07a524f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 490e8f1b28..f994ad6e3c 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.6.3
+SYSSTAT_VERSION = 12.2.1
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-file-attr --disable-sensors
