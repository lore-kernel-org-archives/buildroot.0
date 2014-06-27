From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Fri, 27 Jun 2014 12:40:35 -0700
Subject: [Buildroot] [PATCH v2 1/1] opkg: bump to version 0.2.2 and update
	upstream url
In-Reply-To: <20140627082349.50341f05@free-electrons.com>
References: <20140627082349.50341f05@free-electrons.com>
Message-ID: <1403898035-25202-1-git-send-email-vsergeev@kumunetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
---
 package/opkg/opkg.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index c57bd7f..883ef64 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPKG_VERSION = v0.2.0
-OPKG_SOURCE = $(OPKG_VERSION).tar.bz2
-OPKG_SITE = https://bitbucket.org/opkg/opkg/get
+OPKG_VERSION = v0.2.2
+OPKG_SITE = http://git.yoctoproject.org/git/opkg
+OPKG_SITE_METHOD = git
 # Uses PKG_CHECK_MODULES() in configure.ac
 OPKG_DEPENDENCIES = host-pkgconf
 OPKG_LICENSE = GPLv2+
-- 
2.0.0
