From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:26:45 +0100
Subject: [Buildroot] [git commit] boost: add licensing info
Message-ID: <20131211213618.5624B9BFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2eeb4b1d3ba5e63992a1c96f5b8c0cc887efb25b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index d6d10e1..799eb13 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -9,6 +9,8 @@ BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
 BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
+BOOST_LICENSE = Boost Software License 1.0
+BOOST_LICENSE_FILES = LICENSE_1_0.txt
 
 TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
 HOST_CC_VERSION = $(shell $(HOSTCC) -dumpversion)
