From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:28 +0200
Subject: [Buildroot] [PATCH 59/69] boost: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-60-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/boost/boost.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 1d42f6c2a7b0..1bed6b250f98 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -11,8 +11,6 @@ BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = Boost Software License 1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 
-HOST_BOOST_DEPENDENCIES =
-
 # keep host variant as minimal as possible
 HOST_BOOST_FLAGS = --without-icu \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
-- 
2.1.0
