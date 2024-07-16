Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C707BC3DA5E
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9013540BFA;
	Tue, 16 Jul 2024 12:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_seMqjOPbYP; Tue, 16 Jul 2024 12:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA9F340BF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA9F340BF4;
	Tue, 16 Jul 2024 12:43:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 381481BF3E3
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9134C402FE
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfE7GIM733b7 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09FAD403B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09FAD403B2
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ED158438E; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 14:42:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bffb6a2339bbfe28a0ca2399716c3966af4a623c
X-Git-Newrev: 34fbdb0d99d00df578f825f9bf5d211e67413076
X-Patchwork-Hint: ignore
Message-Id: <20240716124308.6ED158438E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-ares: bump to 1.32.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=34fbdb0d99d00df578f825f9bf5d211e67413076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://c-ares.org/changelog.html#1_32_2

License hash changed due to whitespace changes:
https://github.com/c-ares/c-ares/commit/ce4c20afcbf9a05d36d02893e8ebb66726d8396c

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-ares/c-ares.hash | 4 ++--
 package/c-ares/c-ares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 9a2b69c731..e1cf9f657a 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  0a72be66959955c43e2af2fbd03418e82a2bd5464604ec9a62147e37aceb420b  c-ares-1.27.0.tar.gz
+sha256  072ff6b30b9682d965b87eb9b77851dc1cd8e6d8090f6821a56bd8fa89595061  c-ares-1.32.2.tar.gz
 
 # Hash for license file
-sha256  80fff25340df53b0cf0c3cddbca9050b559b9cbed2ad71830327cfef54959aef  LICENSE.md
+sha256  8a9994f85a8e531e1a3217ab7ba509787c6b93056aabe702137ce662db8321c2  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index c2403b9c4c..4b7342cadb 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.27.0
-C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/cares-1_27_0
+C_ARES_VERSION = 1.32.2
+C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v1.32.2
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
