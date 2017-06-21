From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Jun 2017 16:30:56 -0400
Subject: [Buildroot] [PATCH] jansson: bump to version 2.10
In-Reply-To: <20170621203057.4346-1-aduskett@codeblue.com>
References: <20170621203057.4346-1-aduskett@codeblue.com>
Message-ID: <20170621203057.4346-7-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/jansson/jansson.hash | 2 +-
 package/jansson/jansson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index adb345d..7a04586 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	0ad0d074ca049a36637e7abef755d40849ad73e926b93914ce294927b97bd2a5	jansson-2.9.tar.gz
+sha256	78215ad1e277b42681404c1d66870097a50eb084be9d771b1d15576575cf6447	jansson-2.10.tar.gz
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 5e13118..9771434 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.9
+JANSSON_VERSION = 2.10
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
-- 
2.9.4
