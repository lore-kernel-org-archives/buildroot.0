Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A01CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CB30813D7;
	Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMZDY-oRvmSJ; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 528B18143D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 528B18143D;
	Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86DD91BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75DF1813D7
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPQSi4oiNv2e for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6E93813B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6E93813B8
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 931A883AD5; Sun, 22 Sep 2024 10:34:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:31:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb05ba0978e27953a6753936ecf558f33646ae90
X-Git-Newrev: 4857fbea44cd3a98f2ea88babe6ea721ec43df7c
X-Patchwork-Hint: ignore
Message-Id: <20240922103436.931A883AD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-service-identity: bump to
 version 24.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4857fbea44cd3a98f2ea88babe6ea721ec43df7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to typo fix:
https://github.com/pyca/service-identity/commit/93636d7d520ff49ceeb918e9896151c744e8ff94

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-service-identity/python-service-identity.hash | 6 +++---
 package/python-service-identity/python-service-identity.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index 32d8f21ad4..9258e0ddbf 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/service-identity/json
-md5  14a751406024544784459474d93d1ea5  service_identity-23.1.0.tar.gz
-sha256  ecb33cd96307755041e978ab14f8b14e13b40f1fbd525a4dc78f46d2b986431d  service_identity-23.1.0.tar.gz
+md5  64267a4351ee3c225ee12a11bb29fc44  service_identity-24.1.0.tar.gz
+sha256  6829c9d62fb832c2e1c435629b0a8c476e1929881f28bee4d20bc24161009221  service_identity-24.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  51f7c647190e74d19f9f24f1b19645b425eb8f30f049196053686bff188505cf  LICENSE
+sha256  24bd0a9ba7d0eae08a3a6e32a1b09f8e6871fa0325520a2fcb00e1539eaa602a  LICENSE
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 6e61dd951b..4092461634 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 23.1.0
+PYTHON_SERVICE_IDENTITY_VERSION = 24.1.0
 PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/3b/98/2a46c7414ffc1d06ba67d2c2dd62a207a70cb351028a8cd8c85b3dbd1cf7
+PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/38/d2/2ac20fd05f1b6fce31986536da4caeac51ed2e1bb25d4a7d73ca4eccdfab
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
