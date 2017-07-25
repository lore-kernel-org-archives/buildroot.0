From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:49:48 +0200
Subject: [Buildroot] [git commit] package/jsoncpp: bump version to 1.8.1
Message-ID: <20170725194628.5C62F7FCAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c31aafcd4fe28f244410fc6e64f7d3f73b4c400
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jsoncpp/jsoncpp.hash | 2 +-
 package/jsoncpp/jsoncpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index ba5d644..34d76f1 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5deb2462cbf0c0121c9d6c9823ec72fe71417e34242e3509bc7c003d526465bc  jsoncpp-1.8.0.tar.gz
+sha256 858db2faf348f89fdf1062bd3e79256772e897e7f17df73e0624edf004f2f9ac  jsoncpp-1.8.1.tar.gz
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index b1e64dd..b4aea56 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.8.0
+JSONCPP_VERSION = 1.8.1
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
