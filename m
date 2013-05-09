From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 17:51:06 +0200
Subject: [Buildroot] [PATCH 11/12] libsha1: add license informations
In-Reply-To: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368114667-14476-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsha1/libsha1.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libsha1/libsha1.mk b/package/libsha1/libsha1.mk
index e9658af..da6a7b2 100644
--- a/package/libsha1/libsha1.mk
+++ b/package/libsha1/libsha1.mk
@@ -6,6 +6,9 @@
 
 LIBSHA1_VERSION = 0.3
 LIBSHA1_SITE = http://github.com/dottedmag/libsha1/tarball/$(LIBSHA1_VERSION)
+LIBSHA1_LICENSE = BSD-3c or GPL
+LIBSHA1_LICENSE_FILES = COPYING
+
 LIBSHA1_INSTALL_STAGING = YES
 
 # We're getting the source code from Github, so there is no generated
-- 
1.7.9.5
