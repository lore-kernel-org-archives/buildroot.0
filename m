From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:43:30 +0200
Subject: [Buildroot] [git commit] rapidjson: Add comment for
	"_INSTALL_TARGET = NO"
Message-ID: <20150806064338.0EBC28008E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe500c5c5c4a4987c060667152969da0478be198
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is Buildroot convention to comment when "_INSTALL_TARGET = NO".

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rapidjson/rapidjson.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index 1ad9314..5da407b 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -8,6 +8,8 @@ RAPIDJSON_VERSION = v1.0.2
 RAPIDJSON_SITE = $(call github,miloyip,rapidjson,$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
+
+# rapidjson is a header-only C++ library
 RAPIDJSON_INSTALL_TARGET = NO
 RAPIDJSON_INSTALL_STAGING = YES
 
