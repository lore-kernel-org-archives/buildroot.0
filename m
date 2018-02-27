From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:22 -0600
Subject: [Buildroot] [NEXT 07/26] boost: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-8-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/boost/boost.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 9ad83d5..f905d98 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -10,6 +10,7 @@ BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSIO
 BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
+BOOST_CPE_ID = $(BOOST_NAME):$(BOOST_NAME):$(BOOST_VERSION)
 
 # keep host variant as minimal as possible
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
-- 
1.9.1
