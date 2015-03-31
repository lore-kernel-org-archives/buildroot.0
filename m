From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 08:41:53 -0300
Subject: [Buildroot] [PATCH 2/2] harfbuzz: adjust indentation
In-Reply-To: <1427802113-31270-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427802113-31270-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427802113-31270-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/harfbuzz/harfbuzz.mk | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index d392270..0a69b09 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -20,31 +20,31 @@ HARFBUZZ_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -pthread"
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
-	HARFBUZZ_DEPENDENCIES += cairo
-	HARFBUZZ_CONF_OPTS += --with-cairo=yes
+HARFBUZZ_DEPENDENCIES += cairo
+HARFBUZZ_CONF_OPTS += --with-cairo=yes
 else
-	HARFBUZZ_CONF_OPTS += --with-cairo=no
+HARFBUZZ_CONF_OPTS += --with-cairo=no
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
-	HARFBUZZ_DEPENDENCIES += freetype
-	HARFBUZZ_CONF_OPTS += --with-freetype=yes
+HARFBUZZ_DEPENDENCIES += freetype
+HARFBUZZ_CONF_OPTS += --with-freetype=yes
 else
-	HARFBUZZ_CONF_OPTS += --with-freetype=no
+HARFBUZZ_CONF_OPTS += --with-freetype=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-	HARFBUZZ_DEPENDENCIES += libglib2
-	HARFBUZZ_CONF_OPTS += --with-glib=yes
+HARFBUZZ_DEPENDENCIES += libglib2
+HARFBUZZ_CONF_OPTS += --with-glib=yes
 else
-	HARFBUZZ_CONF_OPTS += --with-glib=no
+HARFBUZZ_CONF_OPTS += --with-glib=no
 endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
-	HARFBUZZ_DEPENDENCIES += icu
-	HARFBUZZ_CONF_OPTS += --with-icu=yes
+HARFBUZZ_DEPENDENCIES += icu
+HARFBUZZ_CONF_OPTS += --with-icu=yes
 else
-	HARFBUZZ_CONF_OPTS += --with-icu=no
+HARFBUZZ_CONF_OPTS += --with-icu=no
 endif
 
 $(eval $(autotools-package))
-- 
2.0.5
