From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Jan 2019 13:37:50 +0100
Subject: [Buildroot] [PATCH 6/7] xapian: bump to version 1.4.9
In-Reply-To: <1547383071-11783-1-git-send-email-gilles.talis@gmail.com>
References: <1547383071-11783-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1547383071-11783-7-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/xapian/xapian.hash | 2 +-
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 4fd0dd1..4e41402 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 13f08a0b649c7afa804fa0e85678d693fd6069dd394c9b9e7d41973d74a3b5d3 xapian-core-1.4.7.tar.xz
+sha256 cde9c39d014f04c09b59d9c21551db9794c10617dc69ab4c9826352a533df5cc xapian-core-1.4.9.tar.xz
 sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42 COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 241f37b..df039d4 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.7
+XAPIAN_VERSION = 1.4.9
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
-- 
2.7.4
