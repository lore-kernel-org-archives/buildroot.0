Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5B4CCA470
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 09:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1D7261308;
	Thu,  9 Oct 2025 09:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTXs_OksnTv1; Thu,  9 Oct 2025 09:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B78612D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B78612D1;
	Thu,  9 Oct 2025 09:56:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDE4119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7957961182
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4J0NiQLeJcf for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9321A611D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9321A611D6
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 917A586C3B; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 10:06:38 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 39abeb5c139a33240dc5e8989f5073b1860406fe
X-Git-Newrev: 60305befad74620c75722c84b2c1f0514e298867
X-Patchwork-Hint: ignore
Message-Id: <20251009095540.917A586C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] {linux,
 linux-headers}: bump 6.16.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x,
 5.4.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60305befad74620c75722c84b2c1f0514e298867
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Update the latest kernel releases to:
 - 6.16.9 -> 6.16.11
 - 6.12.49 -> 6.12.51
 - 6.6.108 -> 6.6.110
 - 6.1.154 -> 6.1.155
 - 5.15.193 -> 5.15.194
 - 5.10.244 -> 5.10.245
 - 5.4.299 -> 5.4.300

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4526676432..bbc8a95fbb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 3e0dff74ee..a734aa487e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7ac8c8a3cf05476375deaaa85dfcee095a826ffe557b437f43774fc3b64ce58d  linux-6.16.9.tar.xz
-sha256  234621e146dacce2241049555d550e4f7a6bde67ccd7ef232d47ac8145425526  linux-6.12.49.tar.xz
-sha256  601cd332aa695d16607b353feff369b4a0b36d111be077e8af54bdd41e1968a6  linux-6.6.108.tar.xz
-sha256  6f1aba92c3d0d21299eebb73161a2056c7c78c6ee77462a7cb705bd8cca8b198  linux-6.1.154.tar.xz
+sha256  5f304f0c453d87ac765207359da4f5a733939d1595ef258f1809194fa18dba7b  linux-6.16.11.tar.xz
+sha256  2d55ad149ca7d9ef82595c669430650030cbf9afbbeb42e5cd9b4ba3cc1a7221  linux-6.12.51.tar.xz
+sha256  1bf20daf5543b8759f325e55fb0da4913715e68741627a13380e66aaf219fb1d  linux-6.6.110.tar.xz
+sha256  c29387aeee085fbcbd91236224b9df805063bac43615e75cea2c6b29604a5c73  linux-6.1.155.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c70262d2f902710b773ef2f35c04b3ff2111e5186c8a97da351454180aac1e99  linux-5.15.193.tar.xz
-sha256  210a37cc09f5c2b3d6f011aa1c65d2484d6f4ec17cf90df473f917abb2c26dc0  linux-5.10.244.tar.xz
-sha256  88de95aeeb8d941fe61497f5e2e886bed25a79d509aa71ba25a2727fd7f0bf2d  linux-5.4.299.tar.xz
+sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
+sha256  131e75eb14da6fd683b3882bcd856085cfca47cc1aa89cd2deb1b48d22d29d9f  linux-5.10.245.tar.xz
+sha256  9949210093ca924d7b41162bb4772becd3f28ff726a09d061558929690a1815a  linux-5.4.300.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 05e1c7ae90..3a0bde64e4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -454,13 +454,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.299"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.244"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.193"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.154"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.108"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.49"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.9"	if BR2_KERNEL_HEADERS_6_16
+	default "5.4.300"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.194"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.155"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.110"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.51"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.11"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
