From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] boost: remove empty host dependencies
	definition
Message-ID: <20160703082409.448FF800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c230b3fabaf0c85c678da4df3b8649b682fcd46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/boost.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 1d42f6c..1bed6b2 100644
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
