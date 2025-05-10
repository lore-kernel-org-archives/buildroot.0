Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15F6C3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 17:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 964A3407CC;
	Sat, 10 May 2025 17:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlBEIbRIAdcR; Sat, 10 May 2025 17:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A485F40782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A485F40782;
	Sat, 10 May 2025 17:22:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72C4DE2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C06081E37
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxm2lCssVjd4 for <buildroot@buildroot.org>;
 Sat, 10 May 2025 17:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B203481589
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B203481589
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:22:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D23E86634; Sat, 10 May 2025 17:22:32 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 May 2025 19:18:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4745bad303d64c31f5422839c7d494ea2d20e2d9
X-Git-Newrev: badda6da8e5b6733a7edbac8b27611fae6535d3e
X-Patchwork-Hint: ignore
Message-Id: <20250510172232.9D23E86634@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nss-pam-ldapd: bump version to
 0.9.13
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=badda6da8e5b6733a7edbac8b27611fae6535d3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release announce:
https://arthurdejong.org/nss-pam-ldapd/release-0-9-13

Signed-off-by: Doug Kehn <rdkehn@gmail.com>
[Julien: add link to release announce]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nss-pam-ldapd/nss-pam-ldapd.hash | 6 +++---
 package/nss-pam-ldapd/nss-pam-ldapd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
index 3286f127dc..868c737ab3 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.hash
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -1,5 +1,5 @@
-# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.12.tar.gz.md5
-md5  cc30ee0ab91d6c94b7a343ae09b5dc69  nss-pam-ldapd-0.9.12.tar.gz
+# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.13.tar.gz.md5
+md5  f6fbb61e537029804c401741ecb76224  nss-pam-ldapd-0.9.13.tar.gz
 # Locally computed:
-sha256  c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14  nss-pam-ldapd-0.9.12.tar.gz
+sha256  e01784e17cb533bb66bd0601e205e785263445c3c2df7a6f90232ab4131c716d  nss-pam-ldapd-0.9.13.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
index 60f6328496..92f9ef079e 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.mk
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NSS_PAM_LDAPD_VERSION = 0.9.12
+NSS_PAM_LDAPD_VERSION = 0.9.13
 NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
 NSS_PAM_LDAPD_LICENSE = LGPL-2.1+
 NSS_PAM_LDAPD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
