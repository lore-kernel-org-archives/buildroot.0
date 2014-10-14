From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:54:03 -0300
Subject: [Buildroot] [PATCH 5/6] libnss: bump to version 3.17.2
In-Reply-To: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413284044-20381-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.hash | 5 ++---
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 8c9420c..916aade 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,3 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_1_RTM/src/
-sha1	32347d8b476efa5c7a4cfa21f8e5a1d0d89942ea	nss-3.17.1.tar.gz
-sha256	0e210afba7cd1e033a08f61fcd1f466639649fc413e72aa050f3d52c19376e5f	nss-3.17.1.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_2_RTM/src/
+sha256	134929e44e44b968a4883f4ee513a71ae45d55b486cee41ee8e26c3cc84dab8b	nss-3.17.2.tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 066606f..e7b92e4 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.17.1
+LIBNSS_VERSION = 3.17.2
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.0.4
