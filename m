Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A183C4332F
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 761DB405A7;
	Wed, 20 Apr 2022 20:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HSfH_hYOiV_H; Wed, 20 Apr 2022 20:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63D794058E;
	Wed, 20 Apr 2022 20:43:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 666221C1135
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C5B382C33
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIA4gjCDF85W for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:42:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84BA982C61
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:42:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9202E83F55; Wed, 20 Apr 2022 20:32:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 22:37:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63814cf5a4bf03dd230c392ef937132c1543a86f
X-Git-Newrev: 94e21a0d42f57fe34afd2f8e9effd872389cbc4a
X-Patchwork-Hint: ignore
Message-Id: <20220420203211.9202E83F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-logstash: bump to version
 0.4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=94e21a0d42f57fe34afd2f8e9effd872389cbc4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-logstash/python-logstash.hash | 6 +++---
 package/python-logstash/python-logstash.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-logstash/python-logstash.hash b/package/python-logstash/python-logstash.hash
index ba11c7ffaa..297bb16bf2 100644
--- a/package/python-logstash/python-logstash.hash
+++ b/package/python-logstash/python-logstash.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-logstash/json
-md5	26fafa0ea306025fb7644d70cb38982a  python-logstash-0.4.6.tar.gz
-sha256	10943e5df83f592b4d61b63ad1afff855ccc8c9467f78718f0a59809ba1fe68c  python-logstash-0.4.6.tar.gz
+md5  e2cbc75dd5417cb55acaa3a12bf3afac  python-logstash-0.4.8.tar.gz
+sha256  d04e1ce11ecc107e4a4f3b807fc57d96811e964a554081b3bbb44732f74ef5f9  python-logstash-0.4.8.tar.gz
 # Locally computed sha256 checksums
-sha256	fea6a5c634ac9d9e047151675adc197c16f45bfba3c26ab113f48fb9fa717fff  LICENSE
+sha256  fea6a5c634ac9d9e047151675adc197c16f45bfba3c26ab113f48fb9fa717fff  LICENSE
diff --git a/package/python-logstash/python-logstash.mk b/package/python-logstash/python-logstash.mk
index 68930bb1f9..a78b6e6590 100644
--- a/package/python-logstash/python-logstash.mk
+++ b/package/python-logstash/python-logstash.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LOGSTASH_VERSION = 0.4.6
-PYTHON_LOGSTASH_SITE = https://files.pythonhosted.org/packages/4e/8d/7ff2e8e8e2613e7bb7654790480bb4cf51a55721371adbb631b16cb16dce
+PYTHON_LOGSTASH_VERSION = 0.4.8
+PYTHON_LOGSTASH_SITE = https://files.pythonhosted.org/packages/f7/3b/c3a957bbdd23859f07905fc3d1adfe89957217a347478c58409f0315cf1d
 PYTHON_LOGSTASH_SETUP_TYPE = distutils
 PYTHON_LOGSTASH_LICENSE = MIT
 PYTHON_LOGSTASH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
