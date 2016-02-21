From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:30:18 +0100
Subject: [Buildroot] [git commit] ejabberd: add reason for autoreconf
Message-ID: <20160302202756.344557FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0b6540c07c712309aed6e87e06eb37a29acd6df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
 
