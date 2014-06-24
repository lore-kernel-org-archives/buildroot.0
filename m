From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:53 -0300
Subject: [Buildroot] [PATCH 47/54] avrdude: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-47-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/avrdude/avrdude.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index b45baaf..7876c1d 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -14,6 +14,8 @@ AVRDUDE_SUBDIR = avrdude
 AVRDUDE_AUTORECONF = YES
 AVRDUDE_DEPENDENCIES = libelf libusb libusb-compat ncurses \
 	host-flex host-bison
+AVRDUDE_LICENSE = GPLv2+
+AVRDUDE_LICENSE_FILES = avrdude/COPYING
 
 ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
-- 
1.8.5.5
