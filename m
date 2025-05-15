Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7395DC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49FFA41A5B;
	Fri, 16 May 2025 11:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBWnOk5EIVfv; Fri, 16 May 2025 11:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62BFC4250E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62BFC4250E;
	Fri, 16 May 2025 11:24:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18B04185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6F9B81393
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwuP0zxj0Jfp for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5651883A89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5651883A89
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C21582929; Fri, 16 May 2025 11:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 17:06:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0161ac7af37c34c2e47e2c91b953509b2b7f03ef
X-Git-Newrev: d1804e401f035048510c9d31d71e70997c915ab4
X-Patchwork-Hint: ignore
Message-Id: <20250516112155.4C21582929@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nss-pam-ldapd:
 bump version to 0.9.13
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1804e401f035048510c9d31d71e70997c915ab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

See the release announce:
https://arthurdejong.org/nss-pam-ldapd/release-0-9-13

Signed-off-by: Doug Kehn <rdkehn@gmail.com>
[Julien: add link to release announce]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit badda6da8e5b6733a7edbac8b27611fae6535d3e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
