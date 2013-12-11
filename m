From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:48 -0300
Subject: [Buildroot] [PATCH 15/16] boost: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/boost/boost.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.3.2
