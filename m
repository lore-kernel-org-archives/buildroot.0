Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2404ECD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 19:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A57C084B30;
	Sun,  7 Jun 2026 19:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXCOlPobQzhf; Sun,  7 Jun 2026 19:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 684C784B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780861513;
	bh=fbgaPLaD+XceKD9aWFVUWx5gwzXXWwVsqWSoomKhpis=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f5QdIrckK9q8fkQF2Q91oJD87AcoYw2KlbNQ29cmtb/dxRRUjP7tKt/LXpAU1LFkm
	 pql4o7/CimvwyAFq7O8ce0bTk/B1QipecDoiSyfspTESe0dvFQMgrzpzGAQjiPFY0m
	 9KGUWBXgBtEulR8tb3b4AzRYg5RSUWYsT06jLG7ZXuRcSBXuW29+GnadWgI9rwxiUC
	 fGZaYZQNf5b8D2OSvZST9uqZlFt4xl/Yb0tXv5d5EaSvuvVgJtbtzYvU4alIrv0UuK
	 mZzqvxv2G5dOHR122b6r0Hrj3Xihp2ywug+biTGYBDnJzc6doGRmcROAHForYI95Kj
	 8dEfmlR/YBFBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 684C784B00;
	Sun,  7 Jun 2026 19:45:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2101C345
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 19:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1310A84AF6
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 19:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWUccqP-68ud for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 19:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 041D284AEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 041D284AEE
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 19:45:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 080AE87CE8; Sun,  7 Jun 2026 19:44:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Jun 2026 21:43:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cc0363191c33545adfe327881b32756aef9594b
X-Git-Newrev: 1339bba787deecda28461bff591e029a38d14b53
X-Patchwork-Hint: ignore
Message-Id: <20260607194454.080AE87CE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/at91sam9x5ek*: remove
 at91bootstrap3 license
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4695041244282945762=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4695041244282945762==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1339bba787deecda28461bff591e029a38d14b53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When using a specific git repo and version for at91bootstrap3,
BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES defaults to "LICENSES/MIT.txt".
However the git version we use (namely v3.10.3) does not provide this
file. Actually, it does not provide a license file at all. This causes
‘make legal-info’ to fail with:

    >>> at91bootstrap3 v3.10.3 Collecting legal info
    sha256sum: /builds/buildroot.org/buildroot/output/build/at91bootstrap3-v3.10.3/LICENSES/MIT.txt: No such file or directory
    ERROR: while checking hashes from boot/at91bootstrap3/at91bootstrap3.hash
    ERROR: LICENSES/MIT.txt has wrong sha256 hash:
    ERROR: expected: 5a3809b1c2ba13b7242572322951311c584419f1f8516f665d6c06f0668d78de
    ERROR: got     :
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack
    make[1]: *** [boot/at91bootstrap3/at91bootstrap3.mk:112: at91bootstrap3-legal-info] Error 1

Let's be explicit that there is no license file to check.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913821 (at91sam9x5ek_mmc_dev_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913820 (at91sam9x5ek_mmc_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913819 (at91sam9x5ek_dev_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913818 (at91sam9x5ek_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/at91sam9x5ek_defconfig         | 1 +
 configs/at91sam9x5ek_dev_defconfig     | 1 +
 configs/at91sam9x5ek_mmc_defconfig     | 1 +
 configs/at91sam9x5ek_mmc_dev_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/at91sam9x5ek_defconfig b/configs/at91sam9x5ek_defconfig
index 775fcceae3..246d34edef 100644
--- a/configs/at91sam9x5ek_defconfig
+++ b/configs/at91sam9x5ek_defconfig
@@ -16,6 +16,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index 0f29216736..36441f38e7 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -67,6 +67,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
index a6fd7e05fc..4c2a6255bc 100644
--- a/configs/at91sam9x5ek_mmc_defconfig
+++ b/configs/at91sam9x5ek_mmc_defconfig
@@ -17,6 +17,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 344c6c2eae..908907acda 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -69,6 +69,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y

--===============4695041244282945762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4695041244282945762==--
