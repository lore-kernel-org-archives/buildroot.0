From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 13:54:32 +0200
Subject: [Buildroot] [git commit] package/znc: security bump to version 1.7.3
Message-ID: <20190331115127.CE7A38A58E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=601d9cced09e59b386ead70e1125781d42e8bdd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://wiki.znc.in/ChangeLog/1.7.3

Fixes CVE-2019-9917:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9917
- ZNC before 1.7.3-rc1 allows an existing remote user to cause a Denial
  of Service (crash) via invalid encoding.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 0845df5355..b685a7bf7b 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 60b4e78f54c532c32673d1ef8e5f606c530ef3a6d6b76ea1daa66459a86682a9  znc-1.7.2.tar.gz
+sha256 1e4cc31837a1e8e6cc310873659a167cec16a3fd4281cbc3bf364e42352c113d  znc-1.7.3.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index b2e422c0f0..fdc147a8a1 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.7.2
+ZNC_VERSION = 1.7.3
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
