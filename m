From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Dec 2014 11:08:19 -0300
Subject: [Buildroot] [PATCH 5/6] libfribidi: adjust libtool comment
In-Reply-To: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1418738900-16150-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfribidi/libfribidi.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 2474d7a..20a5df0 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -10,7 +10,8 @@ LIBFRIBIDI_SITE = http://www.fribidi.org/download
 LIBFRIBIDI_LICENSE = LGPLv2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
-# BR's libtool patch doesn't apply
+# Ships a beta libtool version hence our patch doesn't apply.
+# Run autoreconf to regenerate ltmain.sh.
 LIBFRIBIDI_AUTORECONF = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
-- 
2.0.4
