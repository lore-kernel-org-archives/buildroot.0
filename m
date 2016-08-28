From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 15:50:33 +0200
Subject: [Buildroot] [git commit] webkitgtk: security bump to version 2.12.4
Message-ID: <20160828135043.63BA48213B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d50477b52bf71a9cd03b9e2de38c775d82cea0ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-4590 - mishandles about: URLs, which allows remote attackers to
bypass the Same Origin Policy via a crafted web site.

CVE-2016-4591 - mishandles the location variable, which allows remote
attackers to access the local filesystem via unspecified vectors.

CVE-2016-4622 - allows remote attackers to execute arbitrary code or
cause a denial of service (memory corruption) via a crafted web site, a
different vulnerability than CVE-2016-4589, CVE-2016-4623, and
CVE-2016-4624.

CVE-2016-4624 - allows remote attackers to execute arbitrary code or
cause a denial of service (memory corruption) via a crafted web site, a
different vulnerability than CVE-2016-4589, CVE-2016-4622, and
CVE-2016-4623.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index faccb3f..f74677e 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,4 +1,4 @@
-# From http://www.webkitgtk.org/releases/webkitgtk-2.12.3.tar.xz.sha1
-sha1	d6a0d598c09d2d56ba0862f8d9206e89d75317cb	webkitgtk-2.12.3.tar.xz
+# From http://www.webkitgtk.org/releases/webkitgtk-2.12.4.tar.xz.sha1
+sha1	ebfe6015d81129b6a13a9596d065c54e9c1b93f6	webkitgtk-2.12.4.tar.xz
 # Calculated based on the hash above
-sha256	173cbb9a2eca23eee52e99965483ab25aa9c0569ef5b57041fc0c129cc26c307	webkitgtk-2.12.3.tar.xz
+sha256	424d3177599abbc1eb1a1ad7928dd280a62006e992f2fada2e059375a9609a77	webkitgtk-2.12.4.tar.xz
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 2479872..f5c4334 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.12.3
+WEBKITGTK_VERSION = 2.12.4
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
