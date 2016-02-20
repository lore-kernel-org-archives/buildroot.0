From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 19:21:23 +0100
Subject: [Buildroot] [git commit] erlang-p1-tls: bump to version 1.0.0
Message-ID: <20160302202754.CD6997FF3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=345d3b300d963747599809a63c556fd13e811528
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-tls/erlang-p1-tls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index 4f1fc48..f7212c4 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = b070004
+ERLANG_P1_TLS_VERSION = 1.0.0
 ERLANG_P1_TLS_SITE = $(call github,processone,tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = GPLv2+
 ERLANG_P1_TLS_LICENSE_FILES = COPYING
