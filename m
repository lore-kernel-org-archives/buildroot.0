From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 10 Jul 2013 10:25:41 -0700
Subject: [Buildroot] [PATCH 02/11] json-c: define license
In-Reply-To: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1373477150-10251-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/json-c/json-c.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 031b541..0a2f70e 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -9,5 +9,7 @@ JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases/
 JSON_C_INSTALL_STAGING = YES
 JSON_C_MAKE = $(MAKE1)
 JSON_C_CONF_OPT = --disable-oldname-compat
+JSON_C_LICENSE = MIT
+JSON_C_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.4.1
