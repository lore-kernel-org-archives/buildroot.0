From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:56:00 -0300
Subject: [Buildroot] [PATCH 54/54] metacity: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-54-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/metacity/metacity.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 0df09c4..6ded5d1 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -9,6 +9,8 @@ METACITY_VERSION_MAJOR = 2.25
 METACITY_VERSION = $(METACITY_VERSION_MAJOR).1
 METACITY_SOURCE = metacity-$(METACITY_VERSION).tar.bz2
 METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/$(METACITY_VERSION_MAJOR)
+METACITY_LICENSE = GPLv2+
+METACITY_LICENSE_FILES = COPYING
 
 METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
-- 
1.8.5.5
