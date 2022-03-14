Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393CAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 12:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEF10840AC;
	Mon, 14 Mar 2022 12:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9QoZqAR7kfj; Mon, 14 Mar 2022 12:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6FB783E83;
	Mon, 14 Mar 2022 12:22:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7862A1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F8D560EDA
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJOI8SRlA-oy for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB46360EA1
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DA7E283E42; Mon, 14 Mar 2022 12:11:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 13:17:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b526bdb5ee40c753096a397afc2dfa2353c8dc5d
X-Git-Newrev: d4aaa7ac4d86b3f509dea696d972b092d09442d7
X-Patchwork-Hint: ignore
Message-Id: <20220314121152.DA7E283E42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kismet: bump to version 2022-02-R1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d4aaa7ac4d86b3f509dea696d972b092d09442d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linking with -latomic is handled by configure.ac since version
2022-01-R3 and
https://github.com/kismetwireless/kismet/commit/bbdfd21e2b41bf69513ded5ae5ab5a89f22a9912

https://www.kismetwireless.net/release/kismet-2022-02-R1
https://www.kismetwireless.net/release/kismet-2022-01-R3
https://www.kismetwireless.net/release/kismet-2022-01-R2
https://www.kismetwireless.net/release/kismet-2022-01-R1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kismet/kismet.hash | 2 +-
 package/kismet/kismet.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 9a9d2260b9..fc5f854b7e 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c8e31b1babdb0fc93ac38fd0772a24d4b40f865fbc292fa8ec7f4a18ced0135  kismet-2021-08-R1.tar.xz
+sha256  aaae4747f14734a73f601af013c0eee26e13680f5e3675dfce09b7de2e68b8a8  kismet-2022-02-R1.tar.xz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 819ed510d7..3992a392f8 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2021-08-R1
+KISMET_VERSION = 2022-02-R1
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = \
@@ -29,10 +29,6 @@ endif
 
 KISMET_CONF_ENV += CXXFLAGS="$(KISMET_CXXFLAGS)"
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-KISMET_CONF_ENV += LIBS=-latomic
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 KISMET_DEPENDENCIES += libcap
 KISMET_CONF_OPTS += --enable-libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
