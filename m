Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4471BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 17:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAA2F4096F;
	Wed, 29 Dec 2021 17:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnYLlaY_zonN; Wed, 29 Dec 2021 17:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55CA140961;
	Wed, 29 Dec 2021 17:32:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14A671BF36C
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 17:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0293940168
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 17:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-W0-Ee_wswW for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 17:32:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28FFC4010C
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 17:32:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 243C482A50; Wed, 29 Dec 2021 17:26:47 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 18:32:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87a9e75b79a28548bfee97156b5ab5b7544282e0
X-Git-Newrev: e5d483bfa7cf8af6ecacdee2fbcc7d9b7836e932
X-Patchwork-Hint: ignore
Message-Id: <20211229172647.243C482A50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nss-pam-ldapd: bump version to
 0.9.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5d483bfa7cf8af6ecacdee2fbcc7d9b7836e932
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Doug Kehn <rdkehn@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nss-pam-ldapd/nss-pam-ldapd.hash | 6 +++---
 package/nss-pam-ldapd/nss-pam-ldapd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
index 47864c4fe7..e0cdc403ee 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.hash
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -1,5 +1,5 @@
-# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.11.tar.gz.md5
-md5 91df9d46a548aa7aa95d0e7c672215d0  nss-pam-ldapd-0.9.8.tar.gz
+# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.12.tar.gz.md5
+md5 cc30ee0ab91d6c94b7a343ae09b5dc69  nss-pam-ldapd-0.9.12.tar.gz
 # Locally computed:
-sha256 d0d71be06d1a90940b7566ce00cef1a465aae7171d5d062785506a83411ecab6  nss-pam-ldapd-0.9.11.tar.gz
+sha256 c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14  nss-pam-ldapd-0.9.12.tar.gz
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
index 223a9eeaec..60f6328496 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.mk
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NSS_PAM_LDAPD_VERSION = 0.9.11
+NSS_PAM_LDAPD_VERSION = 0.9.12
 NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
 NSS_PAM_LDAPD_LICENSE = LGPL-2.1+
 NSS_PAM_LDAPD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
