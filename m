From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jul 2011 09:09:44 +0200
Subject: [Buildroot] [git commit] toolchain/helpers.mk: unbreak check_glibc
	after PROGRAM_INVOCATION removal
Message-ID: <20110729071057.71B8E8B557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=70db1984dc003452dae7a9b449843c4e13620e00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Thomas Petazzoni on IRC.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 123720b..4d90d15 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -147,7 +147,7 @@ check_glibc = \
 	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
-	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
+	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support)
 
 #
 # Check the conformity of Buildroot configuration with regard to the
-- 
1.7.3.4
