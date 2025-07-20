Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF532C83F3E
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 21:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BACC983AD2;
	Sun, 20 Jul 2025 21:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrF2csul_6ar; Sun, 20 Jul 2025 21:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C050283BBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C050283BBA;
	Sun, 20 Jul 2025 21:30:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 101D61F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B88C81FA0
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOKq5ZfVOkjr for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 21:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460CF83032
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 460CF83032
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35927868FC; Sun, 20 Jul 2025 21:30:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 22:53:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5b13a148f160e2a329e4c16cd5cb67d8051ea9c
X-Git-Newrev: 611fd9b8e7ac432bc889264003beae20d1a1652c
X-Patchwork-Hint: ignore
Message-Id: <20250720213008.35927868FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiodns: bump to version
 3.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=611fd9b8e7ac432bc889264003beae20d1a1652c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to formatting:
https://github.com/aio-libs/aiodns/commit/924b981471b676e90a1f38b1e20223c18b899a0b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiodns/python-aiodns.hash | 6 +++---
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index 3f4d911db7..e0c73c2039 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  0bfcd1b040912744badd2771a33a32fc  aiodns-3.2.0.tar.gz
-sha256  62869b23409349c21b072883ec8998316b234c9a9e36675756e8e317e8768f72  aiodns-3.2.0.tar.gz
+md5  30623b233a06bd318478e39828a771d2  aiodns-3.5.0.tar.gz
+sha256  11264edbab51896ecf546c18eb0dd56dff0428c6aa6d2cd87e643e07300eb310  aiodns-3.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  eb0455d35129425ed399883cd710923de3e246a510e2eb84d9f00032d0bbec97  LICENSE
+sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 9c1bea601c..87aa8830aa 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.2.0
+PYTHON_AIODNS_VERSION = 3.5.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/e7/84/41a6a2765abc124563f5380e76b9b24118977729e25a84112f8dfb2b33dc
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/17/0a/163e5260cecc12de6abc259d158d9da3b8ec062ab863107dcdb1166cdcef
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
