From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 30 Nov 2012 10:14:38 +0000
Subject: [Buildroot] [PATCH 3/8] beecrypt: add license information
In-Reply-To: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
Message-ID: <1354270483-32356-4-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <simond@trainfx.com>

Signed-off-by: Simon Dawson <simond@trainfx.com>
---
 package/beecrypt/beecrypt.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index d165aee..a9cf133 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -7,6 +7,8 @@ BEECRYPT_VERSION = 4.2.1
 BEECRYPT_SITE = http://downloads.sourceforge.net/project/beecrypt/beecrypt/$(BEECRYPT_VERSION)
 BEECRYPT_AUTORECONF = YES
 BEECRYPT_INSTALL_STAGING = YES
+BEECRYPT_LICENSE = LGPLv2.1+
+BEECRYPT_LICENSE_FILES = COPYING.LIB
 
 # beecrypt contains C++ code that g++ 4.7 doesn't really
 # like. Upstream does not seem to be really active, so workaround this
-- 
1.7.10.4
