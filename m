Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AA9C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0B080C55;
	Sat,  3 Aug 2024 20:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dIa6AMTkW46; Sat,  3 Aug 2024 20:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0F4C80D2E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F4C80D2E;
	Sat,  3 Aug 2024 20:29:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4510D1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32F634026F
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3f1GBEjYQwm for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01F25402B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01F25402B1
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65D4483D89; Sat,  3 Aug 2024 20:29:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 22:15:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85e4ad837ebdebea17e6b7e9c05c851b57788584
X-Git-Newrev: 358261b319e3be29e68a86358ccc7bf97fa795f2
X-Patchwork-Hint: ignore
Message-Id: <20240803202942.65D4483D89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flatbuffers: bump version to
 24.3.25
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=358261b319e3be29e68a86358ccc7bf97fa795f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated project URL, rebased patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-include-flatbuffers-base.h-fix-build-on-musl.patch         | 6 +++---
 package/flatbuffers/Config.in                                       | 2 +-
 package/flatbuffers/flatbuffers.hash                                | 2 +-
 package/flatbuffers/flatbuffers.mk                                  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
index 82feca3e39..872db03045 100644
--- a/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
+++ b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
@@ -30,8 +30,8 @@ Fixes:
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: Rejected:
  https://github.com/google/flatbuffers/pull/6773]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(rebased and added fix for uClibc-build)
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+(rebased and added fix for uClibc-build, rebased again for 24.3.25)
 ---
  include/flatbuffers/base.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -40,7 +40,7 @@ diff --git a/include/flatbuffers/base.h b/include/flatbuffers/base.h
 index de7898dc..101c7598 100644
 --- a/include/flatbuffers/base.h
 +++ b/include/flatbuffers/base.h
-@@ -264,7 +264,8 @@ namespace flatbuffers {
+@@ -270,7 +270,8 @@ namespace flatbuffers {
    // strtoull_l}.
    #if (defined(_MSC_VER) && _MSC_VER >= 1800) || \
        (defined(__ANDROID_API__) && __ANDROID_API__>= 21) || \
diff --git a/package/flatbuffers/Config.in b/package/flatbuffers/Config.in
index 992738282f..878bbd0d6d 100644
--- a/package/flatbuffers/Config.in
+++ b/package/flatbuffers/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_FLATBUFFERS
 	  Python. It was originally created at Google for game
 	  development and other performance-critical applications.
 
-	  http://google.github.io/flatbuffers/
+	  https://flatbuffers.dev
 
 comment "flatbuffers needs a toolchain w/ C++, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index 3c3a90d6f3..ac2c9fc63a 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1cce06b17cddd896b6d73cc047e36a254fb8df4d7ea18a46acf16c4c0cd3f3f3  flatbuffers-23.5.26.tar.gz
+sha256  4157c5cacdb59737c5d627e47ac26b140e9ee28b1102f812b36068aab728c1ed  flatbuffers-24.3.25.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 3998a25cdf..33481eabf8 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 23.5.26
+FLATBUFFERS_VERSION = 24.3.25
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
