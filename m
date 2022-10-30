Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8AEECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10987403D6;
	Sun, 30 Oct 2022 14:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10987403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKfbO0edsztw; Sun, 30 Oct 2022 14:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 297BE403AA;
	Sun, 30 Oct 2022 14:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 297BE403AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 218BD1BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AAC440352
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AAC440352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrRXNLM2YP6U for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D2C840399
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D2C840399
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D60A87511; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:04:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de4a180b80905ee74a064d0fbc74d8de4fea7464
X-Git-Newrev: 9af3c14b18c72d6681315280d89d428b7b212ab7
X-Patchwork-Hint: ignore
Message-Id: <20221030140545.6D60A87511@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-certifi: bump to version
 2022.9.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=9af3c14b18c72d6681315280d89d428b7b212ab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index ac3d0a909b..0557a5c97c 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  f919a230b999ebae1969088ca68e8367  certifi-2022.9.14.tar.gz
-sha256  36973885b9542e6bd01dea287b2b4b3b21236307c56324fcc3f1160f2d655ed5  certifi-2022.9.14.tar.gz
+md5  ff9c8d5c7e7fb083de6b874609c5ca68  certifi-2022.9.24.tar.gz
+sha256  0d9c601124e5a6ba9712dbc60d9c53c21e34f5f641fe83002317394311bdce14  certifi-2022.9.24.tar.gz
 # Locally computed sha256 checksums
 sha256  a02f6c638f9fb84d06f7764c3ab085d8af7eda5b93c166da54312479077c6fb0  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 2053d5e820..8e2435199f 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2022.9.14
+PYTHON_CERTIFI_VERSION = 2022.9.24
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/ca/48/88ec470f8b68319b6782ca3a0570789886ad5ca24c1af2f3771699135baa
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/cb/a4/7de7cd59e429bd0ee6521ba58a75adaec136d32f91a761b28a11d8088d44
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
