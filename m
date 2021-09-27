Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111DEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:42:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C511760F11
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C511760F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8539040488;
	Mon, 27 Sep 2021 14:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDCYfnfEAxJG; Mon, 27 Sep 2021 14:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8008A404B8;
	Mon, 27 Sep 2021 14:42:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1171BF97F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6B4481882
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJF9k2EJlwnp for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFAA281839
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A0E968D266; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:34:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10a82e3e50ad89313b813cd84f79059947f13ef9
X-Git-Newrev: ace87cd389efcbc7323ca503a3096e9dcdc6e215
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.A0E968D266@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typepy: bump to version
 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ace87cd389efcbc7323ca503a3096e9dcdc6e215
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-typepy/python-typepy.hash | 4 ++--
 package/python-typepy/python-typepy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index e4d84e9bfc..eade667341 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typepy/json
-md5  cc9ceef1f04a8ff4b979dc23b96f2e80  typepy-1.1.5.tar.gz
-sha256  1bbe790bb8d1b43b4541b235678974d5aee2357e1948cdf17cb4c14cbe4a2a82  typepy-1.1.5.tar.gz
+md5  9f73bef9ce9e9ccf49ed63a2dadada90  typepy-1.3.0.tar.gz
+sha256  96788530614083164993d1443959f6c58e6bb8e2da839812ddf462c203e4b84c  typepy-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index 6d8433e136..6c556df986 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEPY_VERSION = 1.1.5
+PYTHON_TYPEPY_VERSION = 1.3.0
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/08/c8/ebfa4381563f1946a7cd2b03fab14df641c3a9acf8e6ca5f5787dd1f735a
+PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/07/7b/fb32933f2a17992af75c0f96e5538a25fecebd439a82dcc31926ba55d336
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
