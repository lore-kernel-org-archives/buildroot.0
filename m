From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:46 +0530
Subject: [Buildroot] [PATCH 17/21] package: use SPDX short identifier for
	Boost Software License 1.0
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-18-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for Boost Software License 1.0 is BSL-1.0.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/boost/boost.mk       | 2 +-
 package/cppdb/cppdb.mk       | 2 +-
 package/cryptopp/cryptopp.mk | 2 +-
 package/poco/poco.mk         | 2 +-
 package/rapidxml/rapidxml.mk | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index dbe0f09..874c03f 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -8,7 +8,7 @@ BOOST_VERSION = 1.63.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
-BOOST_LICENSE = Boost Software License 1.0
+BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 
 # keep host variant as minimal as possible
diff --git a/package/cppdb/cppdb.mk b/package/cppdb/cppdb.mk
index 2c26c90..e73f04e 100644
--- a/package/cppdb/cppdb.mk
+++ b/package/cppdb/cppdb.mk
@@ -9,7 +9,7 @@ CPPDB_SOURCE = cppdb-$(CPPDB_VERSION).tar.bz2
 CPPDB_SITE = http://downloads.sourceforge.net/project/cppcms/cppdb/$(CPPDB_VERSION)
 CPPDB_INSTALL_STAGING = YES
 CPPDB_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
-CPPDB_LICENSE = Boost-v1.0 or MIT
+CPPDB_LICENSE = BSL-1.0 or MIT
 CPPDB_LICENSE_FILES = LICENSE_1_0.txt MIT.txt
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 456876c..5c5def5 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -7,7 +7,7 @@
 CRYPTOPP_VERSION = 5.6.5
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = http://cryptopp.com/
-CRYPTOPP_LICENSE = Boost-v1.0
+CRYPTOPP_LICENSE = BSL-1.0
 CRYPTOPP_LICENSE_FILES = License.txt
 CRYPTOPP_INSTALL_STAGING = YES
 
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 90dfb34..efb78be 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -6,7 +6,7 @@
 
 POCO_VERSION = poco-1.7.2-release
 POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
-POCO_LICENSE = Boost-v1.0
+POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
 POCO_PATCH = https://github.com/pocoproject/poco/commit/30159aea4b3f6421da9d74a8bf22aad6d3bf26b4.patch
diff --git a/package/rapidxml/rapidxml.mk b/package/rapidxml/rapidxml.mk
index a76a21b..2bec8fe 100644
--- a/package/rapidxml/rapidxml.mk
+++ b/package/rapidxml/rapidxml.mk
@@ -7,7 +7,7 @@
 RAPIDXML_VERSION = 1.13
 RAPIDXML_SOURCE = rapidxml-$(RAPIDXML_VERSION).zip
 RAPIDXML_SITE = http://downloads.sourceforge.net/project/rapidxml/rapidxml/rapidxml%20$(RAPIDXML_VERSION)
-RAPIDXML_LICENSE = Boost Software License 1.0 or MIT
+RAPIDXML_LICENSE = BSL-1.0 or MIT
 RAPIDXML_LICENSE_FILES = license.txt
 
 # C++ headers only
-- 
2.6.2
