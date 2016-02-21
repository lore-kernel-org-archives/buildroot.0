From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 21 Feb 2016 13:11:46 -0500
Subject: [Buildroot] [PATCH v3 3/3] ejabberd: add reason for autoreconf
In-Reply-To: <1456078306-26054-1-git-send-email-fhunleth@troodon-software.com>
References: <1456078306-26054-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1456078306-26054-3-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v2 -> v3:
  - Add reason for autoreconf (suggested by Romain Naour)

 package/ejabberd/ejabberd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index a3aad35..1140eb1 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -13,6 +13,7 @@ EJABBERD_DEPENDENCIES = getent openssl host-erlang-lager erlang-lager \
 	erlang-p1-cache-tab erlang-p1-iconv erlang-p1-sip \
 	erlang-p1-stringprep erlang-p1-xml erlang-p1-yaml erlang-p1-zlib
 
+# 0001-remove-make-targets-for-deps.patch updates Makefile.in
 EJABBERD_USE_AUTOCONF = YES
 EJABBERD_AUTORECONF = YES
 
-- 
2.5.0
