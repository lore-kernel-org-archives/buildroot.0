Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1994BC46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 17:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6CA881DF7;
	Sun, 24 Dec 2023 17:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6CA881DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KXRsBW4RU52; Sun, 24 Dec 2023 17:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04A8C81DEC;
	Sun, 24 Dec 2023 17:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04A8C81DEC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C25CC1BF398
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A72E040481
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A72E040481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wmtjm1s1E5sP for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 17:54:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8238640018
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 17:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8238640018
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 711AB82831; Sun, 24 Dec 2023 17:54:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 18:54:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58bf6a7f051dfe69c78fa5c794ba72357ddae82f
X-Git-Newrev: 80286eb5f19c1291e6a9334347d484ed28c16297
X-Patchwork-Hint: ignore
Message-Id: <20231224175455.711AB82831@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-certifi: bump to version
 2023.11.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=80286eb5f19c1291e6a9334347d484ed28c16297
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to inaccurate date cleanup:
https://github.com/certifi/python-certifi/commit/2103453dd43dbfb859f257b193d9087b3997959a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-certifi/python-certifi.hash | 6 +++---
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index fe0748adb8..48e25119e5 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  10a72845d3fc2c38d212b4b7b1872c76  certifi-2023.7.22.tar.gz
-sha256  539cc1d13202e33ca466e88b2807e29f4c13049d6d87031a3c110744495cb082  certifi-2023.7.22.tar.gz
+md5  5a41f94d681748e76675f3cb4a7d517e  certifi-2023.11.17.tar.gz
+sha256  9b469f3a900bf28dc19b8cfbf8019bf47f7fdd1a65a1d4ffb98fc14166beb4d1  certifi-2023.11.17.tar.gz
 # Locally computed sha256 checksums
-sha256  a02f6c638f9fb84d06f7764c3ab085d8af7eda5b93c166da54312479077c6fb0  LICENSE
+sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 9b5f853682..90aabaa1ac 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2023.7.22
+PYTHON_CERTIFI_VERSION = 2023.11.17
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/98/98/c2ff18671db109c9f10ed27f5ef610ae05b73bd876664139cf95bd1429aa
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/d4/91/c89518dd4fe1f3a4e3f6ab7ff23cb00ef2e8c9adf99dacc618ad5e068e28
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
